import { Marked, Parser, Renderer, MarkedOptions } from "@ts-stack/markdown";
import { isUrl, pathOrUrlToAttachmentMessage } from "~/attachment";
import { type MessageBody, newTextBody, type TokenUsage } from "~/ai-service";
import path from "path";
import * as cheerio from "cheerio";

const obsidianInternalLinkRegex = /\[\[([^\[\]]+?)\]\]/g;
class CustomMdRenderer extends Renderer {
  constructor(
    private rootDirPath?: string,
    private currentDirPath?: string,
    options?: MarkedOptions,
  ) {
    super(options);
  }

  override link(href: string, title: string, text: string): string {
    let destination;
    if (isUrl(href)) {
      destination = href;
    } else {
      destination = this.currentDirPath
        ? path.join(this.currentDirPath, href)
        : href;
    }

    return `<a href="${destination}">${text}</a>`;
  }

  override image(href: string, title: string, text: string): string {
    return this.link(href, title, text);
  }

  override paragraph(text: string) {
    const matched = obsidianInternalLinkRegex.exec(text);

    text = text.replace(obsidianInternalLinkRegex, (match, innerLink) => {
      let destination;
      if (isUrl(innerLink)) {
        destination = innerLink;
      } else {
        destination = this.rootDirPath
          ? path.join(this.rootDirPath, innerLink)
          : innerLink;
      }

      return `<a href="${destination}">${innerLink}</a>`;
    });
    return `<p>` + text + `</p>\n`;
  }
}

function parseMarkdown(
  md: string,
  rootWorkingDir?: string,
  currentDir?: string,
): string {
  const result = Marked.parse(md, {
    renderer: new CustomMdRenderer(rootWorkingDir, currentDir),
    gfm: true,
    tables: true,
    breaks: false,
    pedantic: false,
    sanitize: true,
    smartLists: true,
    smartypants: false,
  });

  return result;
}

type Elem =
  | {
      type: "h2";
      id?: string;
      text?: string;
    }
  | {
      type: "pre";
      content: string;
      class?: string;
    }
  | {
      type: "p_with_link";
      href?: string;
      text: string;
    }
  | {
      type: "p_without_link";
      text: string;
    };

function htmlToElems(html: string): Array<Elem> {
  Array<MessageBody>;
  let parser = cheerio.load(html);

  const elements: Elem[] = [];

  parser("h2, pre, p").each((_index, element) => {
    const el = parser(element);
    if (!el) {
      return null;
    }
    const rawTagName = el.prop("tagName");
    if (!rawTagName) {
      return null;
    }
    const tagName = rawTagName.toLowerCase();

    switch (tagName) {
      case "h2":
        elements.push({
          type: "h2",
          id: el.attr("id"),
          text: el.text(),
        });
        break;
      case "pre":
        elements.push({
          type: "pre",
          content: el.text().trim(),
          class: el.find("code").attr("class"),
        });
        break;
      case "p":
        const link = el.find("a");
        if (link.length > 0) {
          elements.push({
            type: "p_with_link",
            href: link.attr("href"),
            text: link.text(),
          });
        } else {
          elements.push({
            type: "p_without_link",
            text: el.text(),
          });
        }
        break;
    }
  });
  return elements;
}

export async function elemsToMessage(
  elems: Array<Elem>,
): Promise<Array<MessageBody>> {
  let messages: Array<MessageBody> = [];

  for (const eachElem of elems) {
    switch (eachElem.type) {
      case "h2":
        //skip for now
        break;

      case "pre":
        if (eachElem.class) {
          if (eachElem.class.startsWith("lang-")) {
            if (eachElem.class !== "lang-cereb-meta") {
              const lang = eachElem.class.replace("lang-", "");
              messages.push(
                newTextBody(`\`\`\`${lang}\n${eachElem.content}\n\`\`\``),
              );
            }
          } else {
            messages.push(newTextBody(`\`\`\`\n${eachElem.content}\n\`\`\``));
          }
        } else {
          messages.push(newTextBody(`\`\`\`\n${eachElem.content}\n\`\`\``));
        }
        break;

      case "p_with_link":
        if (eachElem.href) {
          messages.push(await pathOrUrlToAttachmentMessage(eachElem.href));
        }
        break;

      case "p_without_link":
        messages.push(newTextBody(eachElem.text));
        break;
    }
  }

  return messages;
}

export async function messagesFromMarkdown(
  md: string,
  rootWorkingDir?: string,
  currentDir?: string,
): Promise<Array<MessageBody>> {
  const parsedHtml = parseMarkdown(md, rootWorkingDir, currentDir);
  const elems = htmlToElems(parsedHtml);
  return await elemsToMessage(elems);
}

export function messageBodyToMarkdown(
  role: string,
  contents: Array<MessageBody>,
  meta?: TokenUsage,
): string {
  let content = contents
    .map((content) => {
      if (content.type === "text") {
        return content.text;
      }
      return null;
    })
    .join("\n");
  if (meta) {
    content += `\n\`\`\`cereb-meta
input  token: ${meta.inputToken}
output token: ${meta.outputToken}
\`\`\`
`;
  }

  return `${role}
---
${content}`;
}

// TODO(tacogips) test
//user
//---
//
//\`\`\`python
//1+2
//\`\`\`
//
//\`\`\`sql
//select * from sss
//\`\`\`
//
//\`\`\`
//some text
//\`\`\`
//
//
//![some](image.png)
//
//[aaa](image.png)
//
//what is this?
//
//[[image.png]]
//
//[aaa](http://tacogips.me/some.jpg)
//
//what is this, again?
//
//
//
//
//
//assistant
//---
//
//	asdf
//`;
//
//
//[
//  {
//    type: "h2",
//    id: "dummy",
//    text: "dummy",
//  }, {
//    type: "h2",
//    id: "user",
//    text: "user",
//  }, {
//    type: "pre",
//    content: "1+2",
//    class: "lang-python",
//  }, {
//    type: "pre",
//    content: "select * from sss",
//    class: "lang-sql",
//  }, {
//    type: "pre",
//    content: "some text",
//    class: undefined,
//  }, {
//    type: "p_with_link",
//    href: "/d/some/root/current/image.png",
//    text: "some",
//  }, {
//    type: "p_with_link",
//    href: "/d/some/root/current/image.png",
//    text: "aaa",
//  }, {
//    type: "p_with_link",
//    href: "/d/some/root/image.png",
//    text: "image.png",
//  }, {
//    type: "p_with_link",
//    href: "http://tacogips.me/some.jpg",
//    text: "aaa",
//  }, {
//    type: "p_without_link",
//    text: "what is this?",
//  }, {
//    type: "p_without_link",
//    text: "そうですね",
//  }, {
//    type: "h2",
//    id: "assistant",
//    text: "assistant",
//  }, {
//    type: "pre",
//    content: "asdf",
//    class: undefined,
//  }
//]
//± just dev
//bun src/main.ts
//null
//null
//null
//null
//null
//[ "[[image.png]]", "image.png" ]
//null
//null
//null
//<h2 id="user">user</h2>
//
//<pre><code class="lang-python">1+2
//</code></pre>
//
//<pre><code class="lang-sql">select * from sss
//</code></pre>
//
//<pre><code>some text
//</code></pre>
//<p><a href="/d/some/root/current/image.png">some</a></p>
//<p><a href="/d/some/root/current/image.png">aaa</a></p>
//<p>what is this?</p>
//<p><a href="/d/some/root/image.png">image.png</a></p>
//<p><a href="http://tacogips.me/some.jpg">aaa</a></p>
//<p>what is this, again?</p>
//<h2 id="assistant">assistant</h2>
//
//<pre><code>asdf
//</code></pre>
//
//[
//  {
//    type: "h2",
//    id: "user",
//    text: "user",
//  }, {
//    type: "pre",
//    content: "1+2",
//    class: "lang-python",
//  }, {
//    type: "pre",
//    content: "select * from sss",
//    class: "lang-sql",
//  }, {
//    type: "pre",
//    content: "some text",
//    class: undefined,
//  }, {
//    type: "p_with_link",
//    href: "/d/some/root/current/image.png",
//    text: "some",
//  }, {
//    type: "p_with_link",
//    href: "/d/some/root/current/image.png",
//    text: "aaa",
//  }, {
//    type: "p_without_link",
//    text: "what is this?",
//  }, {
//    type: "p_with_link",
//    href: "/d/some/root/image.png",
//    text: "image.png",
//  }, {
//    type: "p_with_link",
//    href: "http://tacogips.me/some.jpg",
//    text: "aaa",
//  }, {
//    type: "p_without_link",
//    text: "what is this, again?",
//  }, {
//    type: "h2",
//    id: "assistant",
//    text: "assistant",
//  }, {
//    type: "pre",
//    content: "asdf",
//    class: undefined,
//  }
//]
