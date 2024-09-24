import { Anthropic } from "@anthropic-ai/sdk";
import { type ClaudeConfig, loadClaudeConfig } from "./config";

import {
  type AiClient,
  type Chat,
  type Query,
  type MessageHistory,
  type MessageBody,
  type TokenUsage,
  type QueryResponse,
  strToImageType,
} from "~/ai-service";

const claudeConfig: ClaudeConfig = loadClaudeConfig();

export class ClaudeClient implements AiClient {
  private client: Anthropic;
  private config: ClaudeConfig;
  constructor(private modelName: string) {
    if (!claudeConfig.apiKey) {
      throw new Error("apiKey for claude is not set");
    }
    this.client = new Anthropic({ apiKey: claudeConfig.apiKey });
    this.config = claudeConfig;
  }

  async newChat(): Promise<Chat> {
    return new ClaudeChat(this.client, this.modelName, this.config) as Chat;
  }
}

class ClaudeChat implements Chat {
  inputTokenSummary: number = 0;
  outputTokenSummary: number = 0;
  messageHistory: Array<MessageHistory> = [];

  constructor(
    private client: Anthropic,
    private model: string,
    private config: ClaudeConfig,
  ) {}

  tokenUsage(): TokenUsage {
    return {
      inputToken: this.inputTokenSummary,
      outputToken: this.outputTokenSummary,
    };
  }
  history(): Array<MessageHistory> {
    return this.messageHistory;
  }

  async sendQuery(query: Query): Promise<QueryResponse> {
    var messages: Array<Anthropic.MessageParam> = this.messageHistory.map(
      (eachMessage) => messageHistoryToParam(eachMessage),
    );
    const newMessageParams = query.bodies.map((eachBody) =>
      messageBodyToParam(eachBody),
    );
    const newMessage: Anthropic.MessageParam = {
      role: "user",
      content: newMessageParams,
    };
    messages.push(newMessage);

    let maxToken: number;

    if (query.maxToken) {
      maxToken = query.maxToken | 0;
      if (maxToken <= 0) {
        maxToken = this.config.defaultMaxToken;
      }
    } else {
      maxToken = this.config.defaultMaxToken;
    }
    const response: Anthropic.Message = await this.client.messages.create({
      model: this.model,
      max_tokens: maxToken,
      system: query.systemPrompt,
      temperature: query.temperature,

      messages,
    });

    const responseBodies = response.content.map((each) =>
      contentToMessageBody(each),
    );
    const newAssistantMesageHisotries: MessageHistory = {
      role: "assistant",
      messages: responseBodies,
    };

    const newUserMessageHistories: MessageHistory = {
      role: "user",
      messages: newMessageParams.map((eachMessage) =>
        paramToMessageBody(eachMessage),
      ),
    };
    this.messageHistory.push(
      newUserMessageHistories,
      newAssistantMesageHisotries,
    );
    const { input_tokens, output_tokens } = response.usage;
    this.inputTokenSummary += input_tokens;
    this.outputTokenSummary += output_tokens;

    return {
      tokenUsage: { inputToken: input_tokens, outputToken: output_tokens },
      content: responseBodies,
    };
  }
}

function messageBodyToParam(
  messageBody: MessageBody,
): Anthropic.TextBlockParam | Anthropic.ImageBlockParam {
  switch (messageBody.type) {
    case "text":
      return { text: messageBody.text, type: "text" };
    case "image":
      return {
        source: {
          data: messageBody.base64Image,
          media_type: messageBody.imageType,
          type: "base64",
        },
        type: "image",
      };
  }
}

function messageHistoryToParam(
  messageHistory: MessageHistory,
): Anthropic.MessageParam {
  return {
    role: messageHistory.role,
    content: messageHistory.messages.map((eachMessage) =>
      messageBodyToParam(eachMessage),
    ),
  };
}

function paramToMessageBody(
  param: Anthropic.TextBlockParam | Anthropic.ImageBlockParam,
): MessageBody {
  switch (param.type) {
    case "text":
      return { type: "text", text: param.text };

    case "image":
      const imageType = strToImageType[param.source.media_type];
      if (!imageType) {
        throw new Error("unknown image type ${param.source.media_type}");
      }
      return {
        type: "image",
        imageType,
        base64Image: param.source.data,
      };
  }
}

function contentToMessageBody(
  param: Anthropic.TextBlock | Anthropic.ToolUseBlock,
): MessageBody {
  switch (param.type) {
    case "text":
      return { type: "text", text: param.text };

    default:
      throw new Error(`not supporte content type ${param.type}`);
  }
}

////TODO(tacogips) tools use is not supported yet in javascript sdk?
//type UserMessage = {
//  role: "user";
//  content: Array<Anthropic.TextBlockParam | Anthropic.ImageBlockParam>;
//};
//
//type AssistantMessage = {
//  role: "assistant";
//  content: Array<Anthropic.TextBlockParam>;
//};

//     Anthropic.ToolUseBlockParam
//     Anthropic.ToolResultBlockParam

//
//
//
//export interface TextBlockParam {
//  text: string;
//
//  type: "text";
//}
//
//export interface ImageBlockParam {
//  source: ImageBlockParam.Source;
//
//  type: "image";
//}
//
//
//export namespace ImageBlockParam {
//  export interface Source {
//    data: string;
//
//    media_type: "image/jpeg" | "image/png" | "image/gif" | "image/webp";
//
//    type: "base64";
//  }
//}
//
//
//
//export interface ToolUseBlockParam {
//  id: string;
//
//  input: unknown;
//
//  name: string;
//
//  type: "tool_use";
//}
//
//zz
//
////export interface Message {
////  /**
////   * Unique object identifier.
////   *
////   * The format and length of IDs may change over time.
////   */
////  id: string;
////
////  /**
////   * Content generated by the model.
////   *
////   * This is an array of content blocks, each of which has a `type` that determines
////   * its shape.
////   *
////   * Example:
////   *
////   * ```json
////   * [{ "type": "text", "text": "Hi, I'm Claude." }]
////   * ```
////   *
////   * If the request input `messages` ended with an `assistant` turn, then the
////   * response `content` will continue directly from that last turn. You can use this
////   * to constrain the model's output.
////   *
////   * For example, if the input `messages` were:
////   *
////   * ```json
////   * [
////   *   {
////   *     "role": "user",
////   *     "content": "What's the Greek name for Sun? (A) Sol (B) Helios (C) Sun"
////   *   },
////   *   { "role": "assistant", "content": "The best answer is (" }
////   * ]
////   * ```
////   *
////   * Then the response `content` might be:
////   *
////   * ```json
////   * [{ "type": "text", "text": "B)" }]
////   * ```
////   */
////  content: Array<ContentBlock>;
////
////  /**
////   * The model that will complete your prompt.\n\nSee
////   * [models](https://docs.anthropic.com/en/docs/models-overview) for additional
////   * details and options.
////   */
////  model: Model;
////
////  /**
////   * Conversational role of the generated message.
////   *
////   * This will always be `"assistant"`.
////   */
////  role: "assistant";
////
////  /**
////   * The reason that we stopped.
////   *
////   * This may be one the following values:
////   *
////   * - `"end_turn"`: the model reached a natural stopping point
////   * - `"max_tokens"`: we exceeded the requested `max_tokens` or the model's maximum
////   * - `"stop_sequence"`: one of your provided custom `stop_sequences` was generated
////   * - `"tool_use"`: the model invoked one or more tools
////   *
////   * In non-streaming mode this value is always non-null. In streaming mode, it is
////   * null in the `message_start` event and non-null otherwise.
////   */
////  stop_reason: "end_turn" | "max_tokens" | "stop_sequence" | "tool_use" | null;
////
////  /**
////   * Which custom stop sequence was generated, if any.
////   *
////   * This value will be a non-null string if one of your custom stop sequences was
////   * generated.
////   */
////  stop_sequence: string | null;
////
////  /**
////   * Object type.
////   *
////   * For Messages, this is always `"message"`.
////   */
////  type: "message";
////
////  /**
////   * Billing and rate-limit usage.
////   *
////   * Anthropic's API bills and rate-limits by token counts, as tokens represent the
////   * underlying cost to our systems.
////   *
////   * Under the hood, the API transforms requests into a format suitable for the
////   * model. The model's output then goes through a parsing stage before becoming an
////   * API response. As a result, the token counts in `usage` will not match one-to-one
////   * with the exact visible content of an API request or response.
////   *
////   * For example, `output_tokens` will be non-zero, even for an empty string response
////   * from Claude.
////   */
////  usage: Usage;
////}
////
