# This file has been generated by node2nix 1.11.1. Do not edit!

{nodeEnv, fetchurl, fetchgit, nix-gitignore, stdenv, lib, globalBuildInputs ? []}:

let
  sources = {
    "@anthropic-ai/sdk-0.27.3" = {
      name = "_at_anthropic-ai_slash_sdk";
      packageName = "@anthropic-ai/sdk";
      version = "0.27.3";
      src = fetchurl {
        url = "https://registry.npmjs.org/@anthropic-ai/sdk/-/sdk-0.27.3.tgz";
        sha512 = "IjLt0gd3L4jlOfilxVXTifn42FnVffMgDC04RJK1KDZpmkBWLv0XC92MVVmkxrFZNS/7l3xWgP/I3nqtX1sQHw==";
      };
    };
    "@ts-stack/markdown-1.5.0" = {
      name = "_at_ts-stack_slash_markdown";
      packageName = "@ts-stack/markdown";
      version = "1.5.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/@ts-stack/markdown/-/markdown-1.5.0.tgz";
        sha512 = "ntVX2Kmb2jyTdH94plJohokvDVPvp6CwXHqsa9NVZTK8cOmHDCYNW0j6thIadUVRTStJhxhfdeovLd0owqDxLw==";
      };
    };
    "@types/node-18.19.75" = {
      name = "_at_types_slash_node";
      packageName = "@types/node";
      version = "18.19.75";
      src = fetchurl {
        url = "https://registry.npmjs.org/@types/node/-/node-18.19.75.tgz";
        sha512 = "UIksWtThob6ZVSyxcOqCLOUNg/dyO1Qvx4McgeuhrEtHTLFTf7BBhEazaE4K806FGTPtzd/2sE90qn4fVr7cyw==";
      };
    };
    "@types/node-fetch-2.6.12" = {
      name = "_at_types_slash_node-fetch";
      packageName = "@types/node-fetch";
      version = "2.6.12";
      src = fetchurl {
        url = "https://registry.npmjs.org/@types/node-fetch/-/node-fetch-2.6.12.tgz";
        sha512 = "8nneRWKCg3rMtF69nLQJnOYUcbafYeFSjqkw3jCRLsqkWFlHaoQrr5mXmofFGOx3DKn7UfmBMyov8ySvLRVldA==";
      };
    };
    "abort-controller-3.0.0" = {
      name = "abort-controller";
      packageName = "abort-controller";
      version = "3.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/abort-controller/-/abort-controller-3.0.0.tgz";
        sha512 = "h8lQ8tacZYnR3vNQTgibj+tODHI5/+l06Au2Pcriv/Gmet0eaj4TwWH41sO9wnHDiQsEj19q0drzdWdeAHtweg==";
      };
    };
    "agentkeepalive-4.6.0" = {
      name = "agentkeepalive";
      packageName = "agentkeepalive";
      version = "4.6.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/agentkeepalive/-/agentkeepalive-4.6.0.tgz";
        sha512 = "kja8j7PjmncONqaTsB8fQ+wE2mSU2DJ9D4XKoJ5PFWIdRMa6SLSN1ff4mOr4jCbfRSsxR4keIiySJU0N9T5hIQ==";
      };
    };
    "asynckit-0.4.0" = {
      name = "asynckit";
      packageName = "asynckit";
      version = "0.4.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/asynckit/-/asynckit-0.4.0.tgz";
        sha512 = "Oei9OH4tRh0YqU3GxhX79dM/mwVgvbZJaSNaRk+bshkj0S5cfHcgYakreBjrHwatXKbz+IoIdYLxrKim2MjW0Q==";
      };
    };
    "boolbase-1.0.0" = {
      name = "boolbase";
      packageName = "boolbase";
      version = "1.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/boolbase/-/boolbase-1.0.0.tgz";
        sha512 = "JZOSA7Mo9sNGB8+UjSgzdLtokWAky1zbztM3WRLCbZ70/3cTANmQmOdR7y2g+J0e2WXywy1yS468tY+IruqEww==";
      };
    };
    "bufferutil-4.0.9" = {
      name = "bufferutil";
      packageName = "bufferutil";
      version = "4.0.9";
      src = fetchurl {
        url = "https://registry.npmjs.org/bufferutil/-/bufferutil-4.0.9.tgz";
        sha512 = "WDtdLmJvAuNNPzByAYpRo2rF1Mmradw6gvWsQKf63476DDXmomT9zUiGypLcG4ibIM67vhAj8jJRdbmEws2Aqw==";
      };
    };
    "cheerio-1.0.0" = {
      name = "cheerio";
      packageName = "cheerio";
      version = "1.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/cheerio/-/cheerio-1.0.0.tgz";
        sha512 = "quS9HgjQpdaXOvsZz82Oz7uxtXiy6UIsIQcpBj7HRw2M63Skasm9qlDocAM7jNuaxdhpPU7c4kJN+gA5MCu4ww==";
      };
    };
    "cheerio-select-2.1.0" = {
      name = "cheerio-select";
      packageName = "cheerio-select";
      version = "2.1.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/cheerio-select/-/cheerio-select-2.1.0.tgz";
        sha512 = "9v9kG0LvzrlcungtnJtpGNxY+fzECQKhK4EGJX2vByejiMX84MFNQw4UxPJl3bFbTMw+Dfs37XaIkCwTZfLh4g==";
      };
    };
    "combined-stream-1.0.8" = {
      name = "combined-stream";
      packageName = "combined-stream";
      version = "1.0.8";
      src = fetchurl {
        url = "https://registry.npmjs.org/combined-stream/-/combined-stream-1.0.8.tgz";
        sha512 = "FQN4MRfuJeHf7cBbBMJFXhKSDq+2kAArBlmRBvcvFE5BB1HZKXtSFASDhdlz9zOYwxh8lDdnvmMOe/+5cdoEdg==";
      };
    };
    "commander-12.1.0" = {
      name = "commander";
      packageName = "commander";
      version = "12.1.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/commander/-/commander-12.1.0.tgz";
        sha512 = "Vw8qHK3bZM9y/P10u3Vib8o/DdkvA2OtPtZvD871QKjy74Wj1WSKFILMPRPSdUSx5RFK1arlJzEtA4PkFgnbuA==";
      };
    };
    "css-select-5.1.0" = {
      name = "css-select";
      packageName = "css-select";
      version = "5.1.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/css-select/-/css-select-5.1.0.tgz";
        sha512 = "nwoRF1rvRRnnCqqY7updORDsuqKzqYJ28+oSMaJMMgOauh3fvwHqMS7EZpIPqK8GL+g9mKxF1vP/ZjSeNjEVHg==";
      };
    };
    "css-what-6.1.0" = {
      name = "css-what";
      packageName = "css-what";
      version = "6.1.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/css-what/-/css-what-6.1.0.tgz";
        sha512 = "HTUrgRJ7r4dsZKU6GjmpfRK1O76h97Z8MfS1G0FozR+oF2kG6Vfe8JE6zwrkbxigziPHinCJ+gCPjA9EaBDtRw==";
      };
    };
    "delayed-stream-1.0.0" = {
      name = "delayed-stream";
      packageName = "delayed-stream";
      version = "1.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/delayed-stream/-/delayed-stream-1.0.0.tgz";
        sha512 = "ZySD7Nf91aLB0RxL4KGrKHBXl7Eds1DAmEdcoVawXnLD7SDhpNgtuII2aAkg7a7QS41jxPSZ17p4VdGnMHk3MQ==";
      };
    };
    "dom-serializer-2.0.0" = {
      name = "dom-serializer";
      packageName = "dom-serializer";
      version = "2.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/dom-serializer/-/dom-serializer-2.0.0.tgz";
        sha512 = "wIkAryiqt/nV5EQKqQpo3SToSOV9J0DnbJqwK7Wv/Trc92zIAYZ4FlMu+JPFW1DfGFt81ZTCGgDEabffXeLyJg==";
      };
    };
    "domelementtype-2.3.0" = {
      name = "domelementtype";
      packageName = "domelementtype";
      version = "2.3.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/domelementtype/-/domelementtype-2.3.0.tgz";
        sha512 = "OLETBj6w0OsagBwdXnPdN0cnMfF9opN69co+7ZrbfPGrdpPVNBUj02spi6B1N7wChLQiPn4CSH/zJvXw56gmHw==";
      };
    };
    "domhandler-5.0.3" = {
      name = "domhandler";
      packageName = "domhandler";
      version = "5.0.3";
      src = fetchurl {
        url = "https://registry.npmjs.org/domhandler/-/domhandler-5.0.3.tgz";
        sha512 = "cgwlv/1iFQiFnU96XXgROh8xTeetsnJiDsTc7TYCLFd9+/WNkIqPTxiM/8pSd8VIrhXGTf1Ny1q1hquVqDJB5w==";
      };
    };
    "domutils-3.2.2" = {
      name = "domutils";
      packageName = "domutils";
      version = "3.2.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/domutils/-/domutils-3.2.2.tgz";
        sha512 = "6kZKyUajlDuqlHKVX1w7gyslj9MPIXzIFiz/rGu35uC1wMi+kMhQwGhl4lt9unC9Vb9INnY9Z3/ZA3+FhASLaw==";
      };
    };
    "encoding-0.1.13" = {
      name = "encoding";
      packageName = "encoding";
      version = "0.1.13";
      src = fetchurl {
        url = "https://registry.npmjs.org/encoding/-/encoding-0.1.13.tgz";
        sha512 = "ETBauow1T35Y/WZMkio9jiM0Z5xjHHmJ4XmjZOq1l/dXz3lr2sRn87nJy20RupqSh1F2m3HHPSp8ShIPQJrJ3A==";
      };
    };
    "encoding-sniffer-0.2.0" = {
      name = "encoding-sniffer";
      packageName = "encoding-sniffer";
      version = "0.2.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/encoding-sniffer/-/encoding-sniffer-0.2.0.tgz";
        sha512 = "ju7Wq1kg04I3HtiYIOrUrdfdDvkyO9s5XM8QAj/bN61Yo/Vb4vgJxy5vi4Yxk01gWHbrofpPtpxM8bKger9jhg==";
      };
    };
    "entities-4.5.0" = {
      name = "entities";
      packageName = "entities";
      version = "4.5.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/entities/-/entities-4.5.0.tgz";
        sha512 = "V0hjH4dGPh9Ao5p0MoRY6BVqtwCjhz6vI5LT8AJ55H+4g9/4vbHx1I54fS0XuclLhDHArPQCiMjDxjaL8fPxhw==";
      };
    };
    "event-target-shim-5.0.1" = {
      name = "event-target-shim";
      packageName = "event-target-shim";
      version = "5.0.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/event-target-shim/-/event-target-shim-5.0.1.tgz";
        sha512 = "i/2XbnSz/uxRCU6+NdVJgKWDTM427+MqYbkQzD321DuCQJUqOuJKIA0IM2+W2xtYHdKOmZ4dR6fExsd4SXL+WQ==";
      };
    };
    "form-data-4.0.1" = {
      name = "form-data";
      packageName = "form-data";
      version = "4.0.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/form-data/-/form-data-4.0.1.tgz";
        sha512 = "tzN8e4TX8+kkxGPK8D5u0FNmjPUjw3lwC9lSLxxoB/+GtsJG91CO8bSWy73APlgAZzZbXEYZJuxjkHH2w+Ezhw==";
      };
    };
    "form-data-encoder-1.7.2" = {
      name = "form-data-encoder";
      packageName = "form-data-encoder";
      version = "1.7.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/form-data-encoder/-/form-data-encoder-1.7.2.tgz";
        sha512 = "qfqtYan3rxrnCk1VYaA4H+Ms9xdpPqvLZa6xmMgFvhO32x7/3J/ExcTd6qpxM0vH2GdMI+poehyBZvqfMTto8A==";
      };
    };
    "formdata-node-4.4.1" = {
      name = "formdata-node";
      packageName = "formdata-node";
      version = "4.4.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/formdata-node/-/formdata-node-4.4.1.tgz";
        sha512 = "0iirZp3uVDjVGt9p49aTaqjk84TrglENEDuqfdlZQ1roC9CWlPk6Avf8EEnZNcAqPonwkG35x4n3ww/1THYAeQ==";
      };
    };
    "get-stdin-9.0.0" = {
      name = "get-stdin";
      packageName = "get-stdin";
      version = "9.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/get-stdin/-/get-stdin-9.0.0.tgz";
        sha512 = "dVKBjfWisLAicarI2Sf+JuBE/DghV4UzNAVe9yhEJuzeREd3JhOTE9cUaJTeSa77fsbQUK3pcOpJfM59+VKZaA==";
      };
    };
    "htmlparser2-9.1.0" = {
      name = "htmlparser2";
      packageName = "htmlparser2";
      version = "9.1.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/htmlparser2/-/htmlparser2-9.1.0.tgz";
        sha512 = "5zfg6mHUoaer/97TxnGpxmbR7zJtPwIYFMZ/H5ucTlPZhKvtum05yiPK3Mgai3a0DyVxv7qYqoweaEd2nrYQzQ==";
      };
    };
    "humanize-ms-1.2.1" = {
      name = "humanize-ms";
      packageName = "humanize-ms";
      version = "1.2.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/humanize-ms/-/humanize-ms-1.2.1.tgz";
        sha512 = "Fl70vYtsAFb/C06PTS9dZBo7ihau+Tu/DNCk/OyHhea07S+aeMWpFFkUaXRa8fI+ScZbEI8dfSxwY7gxZ9SAVQ==";
      };
    };
    "iconv-lite-0.6.3" = {
      name = "iconv-lite";
      packageName = "iconv-lite";
      version = "0.6.3";
      src = fetchurl {
        url = "https://registry.npmjs.org/iconv-lite/-/iconv-lite-0.6.3.tgz";
        sha512 = "4fCk79wshMdzMp2rH06qWrJE4iolqLhCUH+OiuIgU++RB0+94NlDL81atO7GX55uUKueo0txHNtvEyI6D7WdMw==";
      };
    };
    "mime-db-1.52.0" = {
      name = "mime-db";
      packageName = "mime-db";
      version = "1.52.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/mime-db/-/mime-db-1.52.0.tgz";
        sha512 = "sPU4uV7dYlvtWJxwwxHD0PuihVNiE7TyAbQ5SWxDCB9mUYvOgroQOwYQQOKPJ8CIbE+1ETVlOoK1UC2nU3gYvg==";
      };
    };
    "mime-types-2.1.35" = {
      name = "mime-types";
      packageName = "mime-types";
      version = "2.1.35";
      src = fetchurl {
        url = "https://registry.npmjs.org/mime-types/-/mime-types-2.1.35.tgz";
        sha512 = "ZDY+bPm5zTTF+YpCrAU9nK0UgICYPT0QtT1NZWFv4s++TNkcgVaT0g6+4R2uI4MjQjzysHB1zxuWL50hzaeXiw==";
      };
    };
    "ms-2.1.3" = {
      name = "ms";
      packageName = "ms";
      version = "2.1.3";
      src = fetchurl {
        url = "https://registry.npmjs.org/ms/-/ms-2.1.3.tgz";
        sha512 = "6FlzubTLZG3J2a/NVCAleEhjzq5oxgHyaCU9yYXvcLsvoVaHJq/s5xXI6/XXP6tz7R9xAOtHnSO/tXtF3WRTlA==";
      };
    };
    "node-domexception-1.0.0" = {
      name = "node-domexception";
      packageName = "node-domexception";
      version = "1.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/node-domexception/-/node-domexception-1.0.0.tgz";
        sha512 = "/jKZoMpw0F8GRwl4/eLROPA3cfcXtLApP0QzLmUT/HuPCZWyB7IY9ZrMeKw2O/nFIqPQB3PVM9aYm0F312AXDQ==";
      };
    };
    "node-fetch-2.7.0" = {
      name = "node-fetch";
      packageName = "node-fetch";
      version = "2.7.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/node-fetch/-/node-fetch-2.7.0.tgz";
        sha512 = "c4FRfUm/dbcWZ7U+1Wq0AwCyFL+3nt2bEw05wfxSz+DWpWsitgmSgYmy2dQdWyKC1694ELPqMs/YzUSNozLt8A==";
      };
    };
    "node-gyp-build-4.8.4" = {
      name = "node-gyp-build";
      packageName = "node-gyp-build";
      version = "4.8.4";
      src = fetchurl {
        url = "https://registry.npmjs.org/node-gyp-build/-/node-gyp-build-4.8.4.tgz";
        sha512 = "LA4ZjwlnUblHVgq0oBF3Jl/6h/Nvs5fzBLwdEF4nuxnFdsfajde4WfxtJr3CaiH+F6ewcIB/q4jQ4UzPyid+CQ==";
      };
    };
    "nth-check-2.1.1" = {
      name = "nth-check";
      packageName = "nth-check";
      version = "2.1.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/nth-check/-/nth-check-2.1.1.tgz";
        sha512 = "lqjrjmaOoAnWfMmBPL+XNnynZh2+swxiX3WUE0s4yEHI6m+AwrK2UZOimIRl3X/4QctVqS8AiZjFqyOGrMXb/w==";
      };
    };
    "openai-4.83.0" = {
      name = "openai";
      packageName = "openai";
      version = "4.83.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/openai/-/openai-4.83.0.tgz";
        sha512 = "fmTsqud0uTtRKsPC7L8Lu55dkaTwYucqncDHzVvO64DKOpNTuiYwjbR/nVgpapXuYy8xSnhQQPUm+3jQaxICgw==";
      };
    };
    "parse5-7.2.1" = {
      name = "parse5";
      packageName = "parse5";
      version = "7.2.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/parse5/-/parse5-7.2.1.tgz";
        sha512 = "BuBYQYlv1ckiPdQi/ohiivi9Sagc9JG+Ozs0r7b/0iK3sKmrb0b9FdWdBbOdx6hBCM/F9Ir82ofnBhtZOjCRPQ==";
      };
    };
    "parse5-htmlparser2-tree-adapter-7.1.0" = {
      name = "parse5-htmlparser2-tree-adapter";
      packageName = "parse5-htmlparser2-tree-adapter";
      version = "7.1.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/parse5-htmlparser2-tree-adapter/-/parse5-htmlparser2-tree-adapter-7.1.0.tgz";
        sha512 = "ruw5xyKs6lrpo9x9rCZqZZnIUntICjQAd0Wsmp396Ul9lN/h+ifgVV1x1gZHi8euej6wTfpqX8j+BFQxF0NS/g==";
      };
    };
    "parse5-parser-stream-7.1.2" = {
      name = "parse5-parser-stream";
      packageName = "parse5-parser-stream";
      version = "7.1.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/parse5-parser-stream/-/parse5-parser-stream-7.1.2.tgz";
        sha512 = "JyeQc9iwFLn5TbvvqACIF/VXG6abODeB3Fwmv/TGdLk2LfbWkaySGY72at4+Ty7EkPZj854u4CrICqNk2qIbow==";
      };
    };
    "safer-buffer-2.1.2" = {
      name = "safer-buffer";
      packageName = "safer-buffer";
      version = "2.1.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/safer-buffer/-/safer-buffer-2.1.2.tgz";
        sha512 = "YZo3K82SD7Riyi0E1EQPojLz7kpepnSQI9IyPbHHg1XXXevb5dJI7tpyN2ADxGcQbHG7vcyRHk0cbwqcQriUtg==";
      };
    };
    "tr46-0.0.3" = {
      name = "tr46";
      packageName = "tr46";
      version = "0.0.3";
      src = fetchurl {
        url = "https://registry.npmjs.org/tr46/-/tr46-0.0.3.tgz";
        sha512 = "N3WMsuqV66lT30CrXNbEjx4GEwlow3v6rr4mCcv6prnfwhS01rkgyFdjPNBYd9br7LpXV1+Emh01fHnq2Gdgrw==";
      };
    };
    "tslib-2.8.1" = {
      name = "tslib";
      packageName = "tslib";
      version = "2.8.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/tslib/-/tslib-2.8.1.tgz";
        sha512 = "oJFu94HQb+KVduSUQL7wnpmqnfmLsOA/nAh6b6EH0wCEoK0/mPeXU6c3wKDV83MkOuHPRHtSXKKU99IBazS/2w==";
      };
    };
    "typescript-5.7.3" = {
      name = "typescript";
      packageName = "typescript";
      version = "5.7.3";
      src = fetchurl {
        url = "https://registry.npmjs.org/typescript/-/typescript-5.7.3.tgz";
        sha512 = "84MVSjMEHP+FQRPy3pX9sTVV/INIex71s9TL2Gm5FG/WG1SqXeKyZ0k7/blY/4FdOzI12CBy1vGc4og/eus0fw==";
      };
    };
    "undici-6.21.1" = {
      name = "undici";
      packageName = "undici";
      version = "6.21.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/undici/-/undici-6.21.1.tgz";
        sha512 = "q/1rj5D0/zayJB2FraXdaWxbhWiNKDvu8naDT2dl1yTlvJp4BLtOcp2a5BvgGNQpYYJzau7tf1WgKv3b+7mqpQ==";
      };
    };
    "undici-types-5.26.5" = {
      name = "undici-types";
      packageName = "undici-types";
      version = "5.26.5";
      src = fetchurl {
        url = "https://registry.npmjs.org/undici-types/-/undici-types-5.26.5.tgz";
        sha512 = "JlCMO+ehdEIKqlFxk6IfVoAUVmgz7cU7zD/h9XZ0qzeosSHmUJVOzSQvvYSYWXkFXC+IfLKSIffhv0sVZup6pA==";
      };
    };
    "utf-8-validate-6.0.5" = {
      name = "utf-8-validate";
      packageName = "utf-8-validate";
      version = "6.0.5";
      src = fetchurl {
        url = "https://registry.npmjs.org/utf-8-validate/-/utf-8-validate-6.0.5.tgz";
        sha512 = "EYZR+OpIXp9Y1eG1iueg8KRsY8TuT8VNgnanZ0uA3STqhHQTLwbl+WX76/9X5OY12yQubymBpaBSmMPkSTQcKA==";
      };
    };
    "web-streams-polyfill-4.0.0-beta.3" = {
      name = "web-streams-polyfill";
      packageName = "web-streams-polyfill";
      version = "4.0.0-beta.3";
      src = fetchurl {
        url = "https://registry.npmjs.org/web-streams-polyfill/-/web-streams-polyfill-4.0.0-beta.3.tgz";
        sha512 = "QW95TCTaHmsYfHDybGMwO5IJIM93I/6vTRk+daHTWFPhwh+C8Cg7j7XyKrwrj8Ib6vYXe0ocYNrmzY4xAAN6ug==";
      };
    };
    "webidl-conversions-3.0.1" = {
      name = "webidl-conversions";
      packageName = "webidl-conversions";
      version = "3.0.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/webidl-conversions/-/webidl-conversions-3.0.1.tgz";
        sha512 = "2JAn3z8AR6rjK8Sm8orRC0h/bcl/DqL7tRPdGZ4I1CjdF+EaMLmYxBHyXuKL849eucPFhvBoxMsflfOb8kxaeQ==";
      };
    };
    "whatwg-encoding-3.1.1" = {
      name = "whatwg-encoding";
      packageName = "whatwg-encoding";
      version = "3.1.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/whatwg-encoding/-/whatwg-encoding-3.1.1.tgz";
        sha512 = "6qN4hJdMwfYBtE3YBTTHhoeuUrDBPZmbQaxWAqSALV/MeEnR5z1xd8UKud2RAkFoPkmB+hli1TZSnyi84xz1vQ==";
      };
    };
    "whatwg-mimetype-4.0.0" = {
      name = "whatwg-mimetype";
      packageName = "whatwg-mimetype";
      version = "4.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/whatwg-mimetype/-/whatwg-mimetype-4.0.0.tgz";
        sha512 = "QaKxh0eNIi2mE9p2vEdzfagOKHCcj1pJ56EEHGQOVxp8r9/iszLUUV7v89x9O1p/T+NlTM5W7jW6+cz4Fq1YVg==";
      };
    };
    "whatwg-url-5.0.0" = {
      name = "whatwg-url";
      packageName = "whatwg-url";
      version = "5.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/whatwg-url/-/whatwg-url-5.0.0.tgz";
        sha512 = "saE57nupxk6v3HY35+jzBwYa0rKSy0XR8JSxZPwgLr7ys0IBzhGviA1/TUGJLmSVqs8pb9AnvICXEuOHLprYTw==";
      };
    };
    "ws-8.18.0" = {
      name = "ws";
      packageName = "ws";
      version = "8.18.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/ws/-/ws-8.18.0.tgz";
        sha512 = "8VbfWfHLbbwu3+N6OKsOMpBdT4kXPDDB9cJk2bJ6mh9ucxdlnNvH1e+roYkKmN9Nxw2yjz7VzeO9oOz2zJ04Pw==";
      };
    };
    "zod-3.24.1" = {
      name = "zod";
      packageName = "zod";
      version = "3.24.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/zod/-/zod-3.24.1.tgz";
        sha512 = "muH7gBL9sI1nciMZV67X5fTKKBLtwpZ5VBp1vsOQzj1MhrBZ4wlVCm3gedKZWLp0Oyel8sIGfeiz54Su+OVT+A==";
      };
    };
  };
  args = {
    name = "cereb";
    packageName = "cereb";
    src = ./.;
    dependencies = [
      sources."@anthropic-ai/sdk-0.27.3"
      sources."@ts-stack/markdown-1.5.0"
      sources."@types/node-18.19.75"
      sources."@types/node-fetch-2.6.12"
      sources."abort-controller-3.0.0"
      sources."agentkeepalive-4.6.0"
      sources."asynckit-0.4.0"
      sources."boolbase-1.0.0"
      sources."bufferutil-4.0.9"
      sources."cheerio-1.0.0"
      sources."cheerio-select-2.1.0"
      sources."combined-stream-1.0.8"
      sources."commander-12.1.0"
      sources."css-select-5.1.0"
      sources."css-what-6.1.0"
      sources."delayed-stream-1.0.0"
      sources."dom-serializer-2.0.0"
      sources."domelementtype-2.3.0"
      sources."domhandler-5.0.3"
      sources."domutils-3.2.2"
      sources."encoding-0.1.13"
      sources."encoding-sniffer-0.2.0"
      sources."entities-4.5.0"
      sources."event-target-shim-5.0.1"
      sources."form-data-4.0.1"
      sources."form-data-encoder-1.7.2"
      sources."formdata-node-4.4.1"
      sources."get-stdin-9.0.0"
      sources."htmlparser2-9.1.0"
      sources."humanize-ms-1.2.1"
      sources."iconv-lite-0.6.3"
      sources."mime-db-1.52.0"
      sources."mime-types-2.1.35"
      sources."ms-2.1.3"
      sources."node-domexception-1.0.0"
      sources."node-fetch-2.7.0"
      sources."node-gyp-build-4.8.4"
      sources."nth-check-2.1.1"
      sources."openai-4.83.0"
      sources."parse5-7.2.1"
      sources."parse5-htmlparser2-tree-adapter-7.1.0"
      sources."parse5-parser-stream-7.1.2"
      sources."safer-buffer-2.1.2"
      sources."tr46-0.0.3"
      sources."tslib-2.8.1"
      sources."typescript-5.7.3"
      sources."undici-6.21.1"
      sources."undici-types-5.26.5"
      sources."utf-8-validate-6.0.5"
      sources."web-streams-polyfill-4.0.0-beta.3"
      sources."webidl-conversions-3.0.1"
      sources."whatwg-encoding-3.1.1"
      sources."whatwg-mimetype-4.0.0"
      sources."whatwg-url-5.0.0"
      sources."ws-8.18.0"
      sources."zod-3.24.1"
    ];
    buildInputs = globalBuildInputs;
    meta = {
    };
    production = true;
    bypassCache = true;
    reconstructLock = true;
  };
in
{
  args = args;
  sources = sources;
  tarball = nodeEnv.buildNodeSourceDist args;
  package = nodeEnv.buildNodePackage args;
  shell = nodeEnv.buildNodeShell args;
  nodeDependencies = nodeEnv.buildNodeDependencies (lib.overrideExisting args {
    src = stdenv.mkDerivation {
      name = args.name + "-package-json";
      src = nix-gitignore.gitignoreSourcePure [
        "*"
        "!package.json"
        "!package-lock.json"
      ] args.src;
      dontBuild = true;
      installPhase = "mkdir -p $out; cp -r ./* $out;";
    };
  });
}
