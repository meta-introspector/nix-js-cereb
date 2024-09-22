import {
  type MessageBody,
  newAiClientFromModel,
  newTextBody,
} from "./ai-service";
import { pathOrUrlToAttachmentMessage } from "./attachment";
import { messagesFromMarkdown, queryResponseToMarkdown } from "./markdown";

import { Command } from "commander";
import getStdin from "get-stdin";

const program = new Command();
program
  .name("cereb")
  .argument("[input_file]", "input file name or input from stdin")
  .option("--markdown")
  .option("--format <string>", "json|markdown", "json")
  .option(
    "--model <string>",
    "specified or read from environment ${CEREB_DEFAULT_MODEL}",
  )
  .option("--attachement <string>", "file path or url")
  .option("--pretty")
  .parse();

const [inputFile] = program.args;
const { model, format, markdown, attachement, pretty } = program.opts();

type Format = "json" | "markdown";

function validateFormat(format: string): Format {
  if (format !== "json" && format !== "markdown") {
    throw new Error(`Invalid format: ${format}`);
  }
  return format as Format;
}

let input: string;
if (inputFile) {
  input = await Bun.file(inputFile).text();
} else {
  input = await getStdin();
  input = input.trim();
}

if (!input || !input.trim()) {
  console.error("No input file or stdin");
  program.outputHelp();
  process.exit(1);
}

const typedFormat = validateFormat(format);

let messages: Array<MessageBody> = [];
if (attachement) {
  const attachementMessage = await pathOrUrlToAttachmentMessage(attachement);
  messages.push(attachementMessage);
}
if (markdown) {
  messages = await messagesFromMarkdown(input);
} else {
  messages = [newTextBody(input)];
}

const aiClient = newAiClientFromModel(model);
const chat = await aiClient.newChat();
let response = await chat.sendQuery({ bodies: messages });

if (typedFormat === "markdown") {
  const markdownResponse = queryResponseToMarkdown("assistant", response);
  process.stdout.write(markdownResponse);
  process.exit(0);
} else if (typedFormat === "json") {
  if (pretty) {
    process.stdout.write(JSON.stringify(response, null, 4));
  } else {
    process.stdout.write(JSON.stringify(response));
  }

  process.exit(0);
}
