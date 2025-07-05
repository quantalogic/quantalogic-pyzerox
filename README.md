# Quantalogic PyZeroX

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Python](https://img.shields.io/badge/Python-3.8%2B-blue.svg)](https://www.python.org/downloads/)
[![Node.js](https://img.shields.io/badge/Node.js-16%2B-green.svg)](https://nodejs.org/)
[![TypeScript](https://img.shields.io/badge/TypeScript-4.5%2B-blue.svg)](https://www.typescriptlang.org/)

> **🚀 Maintained Fork:** This is a maintained fork of the original [ZeroX project](https://github.com/getomni-ai/zerox) by Omni AI, enhanced and actively maintained by Quantalogic. This version provides extended document processing and LLM-powered workflow capabilities, building on the original foundation with additional features, integrations, and improvements for both Python and Node.js environments.

**Quantalogic PyZeroX** is a cross-platform toolkit for document processing and LLM-powered workflows, supporting both Python and Node.js. It enables rapid prototyping and deployment of AI-driven document pipelines with support for multiple vision models and providers.

**Maintained by [Quantalogic](https://www.quantalogic.app)** - A platform dedicated to advancing AI-powered document processing and workflow automation.

## 📋 Table of Contents

- [✨ Features](#-features)
- [🔧 Prerequisites](#-prerequisites)
- [🚀 Quick Start](#-quick-start)
- [📦 Installation](#-installation)
- [📖 Usage](#-usage)
  - [Node.js Usage](#nodejs-usage)
  - [Python Usage](#python-usage)
- [🎯 API Reference](#-api-reference)
  - [Node.js API](#nodejs-api)
  - [Python API](#python-api)
- [🤖 Supported Vision Models](#-supported-vision-models)
- [📄 Supported File Types](#-supported-file-types)
- [💡 Examples](#-examples)
- [🔧 Development](#-development)
- [📚 Documentation](#-documentation)
- [🤝 Contributing](#-contributing)
- [📜 License](#-license)

## ✨ Features

- **🌐 Multi-platform Support**: Works seamlessly with both Python and Node.js
- **🤖 Multiple LLM Providers**: OpenAI, Azure OpenAI, AWS Bedrock, Google Gemini, Anthropic
- **📄 Document Processing**: PDF, Word, Excel, PowerPoint, and 20+ file formats
- **🔄 OCR to Markdown**: Convert documents to structured markdown format
- **🎯 Data Extraction**: Extract structured data using JSON schemas
- **⚡ Concurrent Processing**: Process multiple pages simultaneously for speed
- **🎨 Format Preservation**: Maintain document formatting across pages
- **🖥️ Cross-platform**: Works on Windows, macOS, and Linux

## 🔧 Prerequisites

### System Dependencies

**For Python:**
- Python 3.8 or higher
- [Poppler](https://poppler.freedesktop.org/) (for PDF processing)

**For Node.js:**
- Node.js 16 or higher
- [GraphicsMagick](http://www.graphicsmagick.org/)
- [Ghostscript](https://www.ghostscript.com/)

### Platform-specific Installation

**macOS:**
```bash
brew install poppler graphicsmagick ghostscript
```

**Ubuntu/Debian:**
```bash
sudo apt-get update
sudo apt-get install -y poppler-utils graphicsmagick ghostscript
```

**Windows:**
- Download and install Poppler from [poppler-windows](https://github.com/oschwartz10612/poppler-windows)
- Download and install GraphicsMagick from [official site](http://www.graphicsmagick.org/download.html)

## 🚀 Quick Start

### Python Quick Start

```python
import asyncio
from pyzerox import zerox
import os

# Set up your API key
os.environ["OPENAI_API_KEY"] = "your-api-key-here"

async def main():
    result = await zerox(
        file_path="path/to/your/document.pdf",
        model="gpt-4o"  # Latest vision-capable model
    )
    print(result)

# Run the example
asyncio.run(main())
```

> **⚠️ Important:** PyZeroX requires vision-capable models to process document images. Ensure you're using a model that supports image input.

### Node.js Quick Start

```typescript
import { zerox } from "zerox";

const result = await zerox({
  filePath: "path/to/your/document.pdf",
  credentials: {
    apiKey: process.env.OPENAI_API_KEY,
  },
});

console.log(result);
```

## 📦 Installation

### Python Installation

```bash
# Install system dependencies (see Prerequisites section)
pip install py-zerox
```

### Node.js Installation

```bash
# Install system dependencies (see Prerequisites section)
npm install zerox
```

### Development Installation

```bash
# Clone the repository
git clone https://github.com/quantalogic/quantalogic-pyzerox.git
cd quantalogic-pyzerox

# Python development setup
poetry install && poetry build

# Node.js development setup
cd node-zerox && npm install && npx tsc

# Run tests
make test  # or individual commands below
poetry run pytest py_zerox/tests/
npm test
```

## 📖 Usage

### Node.js Usage

#### Basic Document Processing

**Process from URL:**

```typescript
import { zerox } from "zerox";

const result = await zerox({
  filePath: "https://example.com/document.pdf",
  credentials: {
    apiKey: process.env.OPENAI_API_KEY,
  },
});
```

**Process from Local Path:**

```typescript
import { zerox } from "zerox";
import path from "path";

const result = await zerox({
  filePath: path.resolve(__dirname, "./document.pdf"),
  credentials: {
    apiKey: process.env.OPENAI_API_KEY,
  },
});
```

#### Advanced Configuration

```typescript
import { zerox } from "zerox";
import { ModelOptions, ModelProvider, ErrorMode } from "zerox/types";

const result = await zerox({
  // Required
  filePath: "path/to/file.pdf",
  credentials: {
    apiKey: "your-api-key",
    // Additional provider-specific credentials as needed
  },

  // Processing Options
  cleanup: true, // Clear images from tmp after run
  concurrency: 10, // Number of pages to run at a time
  correctOrientation: true, // Attempts to identify and correct page orientation
  maintainFormat: false, // Slower but helps maintain consistent formatting

  // Image Processing
  imageDensity: 300, // DPI for image conversion
  imageHeight: 2048, // Maximum height for converted images
  maxImageSize: 15, // Maximum size of images to compress (MB)
  trimEdges: true, // Trims pixels from edges

  // Error Handling
  errorMode: ErrorMode.IGNORE, // ErrorMode.THROW or ErrorMode.IGNORE
  maxRetries: 1, // Number of retries on failed pages

  // Data Extraction
  extractOnly: false, // Extract structured data only
  extractPerPage: false, // Extract data per page vs entire document
  schema: undefined, // JSON schema for structured extraction

  // Model Configuration
  model: ModelOptions.OPENAI_GPT_4O,
  modelProvider: ModelProvider.OPENAI,
  llmParams: {}, // Additional LLM parameters

  // Output Options
  outputDir: undefined, // Save result.md to file
  tempDir: "/tmp", // Temporary files directory

  // Page Selection
  pagesToConvertAsImages: -1, // -1 for all pages, or array [1,2,3]

  // Custom Prompts
  prompt: "", // Custom processing instructions
  extractionPrompt: "", // Custom extraction instructions
});
```

#### Multi-Provider Examples

```typescript
import { zerox } from "zerox";
import { ModelOptions, ModelProvider } from "zerox/types";

// OpenAI
const openaiResult = await zerox({
  filePath: "path/to/file.pdf",
  modelProvider: ModelProvider.OPENAI,
  model: ModelOptions.OPENAI_GPT_4O,
  credentials: {
    apiKey: process.env.OPENAI_API_KEY,
  },
});

// Azure OpenAI
const azureResult = await zerox({
  filePath: "path/to/file.pdf",
  modelProvider: ModelProvider.AZURE,
  model: ModelOptions.OPENAI_GPT_4O,
  credentials: {
    apiKey: process.env.AZURE_API_KEY,
    endpoint: process.env.AZURE_ENDPOINT,
  },
});

// AWS Bedrock
const bedrockResult = await zerox({
  filePath: "path/to/file.pdf",
  modelProvider: ModelProvider.BEDROCK,
  model: ModelOptions.BEDROCK_CLAUDE_3_7_SONNET_2025_02,
  credentials: {
    accessKeyId: process.env.AWS_ACCESS_KEY_ID,
    secretAccessKey: process.env.AWS_SECRET_ACCESS_KEY,
    region: process.env.AWS_REGION,
  },
});

// Google Gemini
const geminiResult = await zerox({
  filePath: "path/to/file.pdf",
  modelProvider: ModelProvider.GOOGLE,
  model: ModelOptions.GOOGLE_GEMINI_2_5_FLASH,
  credentials: {
    apiKey: process.env.GEMINI_API_KEY,
  },
});
```

### Python Usage

#### Basic Document Processing

```python
import asyncio
from pyzerox import zerox
import os

# Set up environment
os.environ["OPENAI_API_KEY"] = "your-api-key"

async def main():
    result = await zerox(
        file_path="path/to/document.pdf",
        model="gpt-4o-mini"
    )
    print(result)

asyncio.run(main())
```

#### Advanced Configuration

```python
import asyncio
from pyzerox import zerox
import os

async def main():
    result = await zerox(
        file_path="https://example.com/document.pdf",
        model="gpt-4o",

        # Processing Options
        cleanup=True,
        concurrency=10,
        maintain_format=False,

        # Page Selection
        select_pages=None,  # None for all, or [1,2,3] for specific pages

        # Output Options
        output_dir="./output",
        temp_dir=None,  # Uses system temp if None

        # Custom Prompts
        custom_system_prompt=None,

        # Additional model parameters
        **{"temperature": 0.1}
    )
    return result

result = asyncio.run(main())
```

#### Multi-Provider Examples

```python
import asyncio
from pyzerox import zerox
import os
import json

# OpenAI
async def openai_example():
    os.environ["OPENAI_API_KEY"] = "your-api-key"
    result = await zerox(
        file_path="document.pdf",
        model="gpt-4o-mini"
    )
    return result

# Azure OpenAI
async def azure_example():
    os.environ["AZURE_API_KEY"] = "your-azure-api-key"
    os.environ["AZURE_API_BASE"] = "https://example-endpoint.openai.azure.com"
    os.environ["AZURE_API_VERSION"] = "2023-05-15"

    result = await zerox(
        file_path="document.pdf",
        model="azure/gpt-4o-mini"
    )
    return result

# Google Gemini (Latest)
async def gemini_example():
    os.environ['GEMINI_API_KEY'] = "your-gemini-api-key"
    result = await zerox(
        file_path="document.pdf",
        model="gemini/gemini-2.5-flash"  # Latest Gemini vision model
    )
    return result

# Anthropic Claude (Latest)
async def anthropic_example():
    os.environ["ANTHROPIC_API_KEY"] = "your-anthropic-api-key"
    result = await zerox(
        file_path="document.pdf",
        model="claude-sonnet-4-20250514"  # Latest Claude with exceptional reasoning
    )
    return result
```

## 🎯 API Reference

### Node.js API

#### `zerox(options)`

**Parameters:**

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `filePath` | `string` | Required | Path to document (local or URL) |
| `credentials` | `object` | Required | API credentials for chosen provider |
| `model` | `ModelOptions` | `OPENAI_GPT_4O` | Model to use for processing |
| `modelProvider` | `ModelProvider` | `OPENAI` | Provider (OPENAI, AZURE, BEDROCK, GOOGLE) |
| `cleanup` | `boolean` | `true` | Clean up temporary files after processing |
| `concurrency` | `number` | `10` | Number of pages to process simultaneously |
| `maintainFormat` | `boolean` | `false` | Maintain formatting across pages (slower) |
| `extractOnly` | `boolean` | `false` | Extract structured data only |
| `schema` | `object` | `undefined` | JSON schema for data extraction |
| `outputDir` | `string` | `undefined` | Directory to save output files |

**Returns:** `Promise<ZeroxOutput>`

### Python API

#### `zerox(file_path, model, **kwargs)`

**Parameters:**

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `file_path` | `str` | Required | Path to document (local or URL) |
| `model` | `str` | `"gpt-4o"` | Model identifier |
| `cleanup` | `bool` | `True` | Clean up temporary files |
| `concurrency` | `int` | `10` | Number of concurrent processes |
| `maintain_format` | `bool` | `False` | Maintain formatting across pages |
| `select_pages` | `Union[int, List[int]]` | `None` | Pages to process (None for all) |
| `output_dir` | `str` | `None` | Directory to save output |
| `custom_system_prompt` | `str` | `None` | Custom system prompt |

**Returns:** `ZeroxOutput`

## 🤖 Supported Vision Models

PyZeroX requires **vision-capable models** for document processing. All models are supported via [LiteLLM](https://docs.litellm.ai/), ensuring compatibility with the latest model releases and API updates.

### OpenAI Vision Models

**Latest Vision Models (2024/2025):**
- **GPT-4.1** (`gpt-4.1`) - Next generation multimodal model
- **GPT-4.1 Mini** (`gpt-4.1-mini`) - Efficient next-gen model
- **o3-mini** (`o3-mini`) - Reasoning model with vision
- **o1-mini** (`o1-mini`) - Advanced reasoning capabilities
- **GPT-4o** (`gpt-4o`) - Stable multimodal vision model
- **GPT-4o Mini** (`gpt-4o-mini`) - Faster, cost-effective vision option
- **GPT-4 Turbo** (`gpt-4-turbo`) - Previous generation with vision

### Azure OpenAI Vision Models

- **GPT-4o** (`azure/gpt-4o`) - Latest multimodal model
- **GPT-4o Mini** (`azure/gpt-4o-mini`) - Cost-effective vision option
- **GPT-4 Turbo** (`azure/gpt-4-turbo`) - Previous generation with vision
- Format: `azure/<deployment-name>`

### Google Gemini Vision Models (AI Studio)

- **Gemini 2.5 Pro** (`gemini/gemini-2.5-pro`) - Most powerful thinking model with vision
- **Gemini 2.5 Flash** (`gemini/gemini-2.5-flash`) - High-performance with adaptive thinking
- **Gemini 2.0 Flash** (`gemini/gemini-2.0-flash`) - Fast and versatile multimodal model
- **Gemini 1.5 Pro** (`gemini/gemini-1.5-pro`) - Large context window with vision
- **Gemini 1.5 Flash** (`gemini/gemini-1.5-flash`) - Fast inference with vision

### Google Vertex AI Vision Models

- **Gemini 2.5 Pro** (`vertex_ai/gemini-2.5-pro`)
- **Gemini 2.5 Flash** (`vertex_ai/gemini-2.5-flash`)
- **Gemini 2.0 Flash** (`vertex_ai/gemini-2.0-flash`)
- **Gemini 1.5 Pro** (`vertex_ai/gemini-1.5-pro`)
- **Gemini 1.5 Flash** (`vertex_ai/gemini-1.5-flash`)

### AWS Bedrock Vision Models

- **Claude 3.7 Sonnet** (`bedrock/us.anthropic.claude-3-7-sonnet-20250219-v1:0`)
- **Claude 3.5 Sonnet** (`bedrock/anthropic.claude-3-5-sonnet-20241022-v2:0`)
- **Claude 3.5 Haiku** (`bedrock/anthropic.claude-3-5-haiku-20241022-v1:0`)
- **Claude 3 Opus** (`bedrock/anthropic.claude-3-opus-20240229-v1:0`)
- **Claude 3 Sonnet** (`bedrock/anthropic.claude-3-sonnet-20240229-v1:0`)
- **Claude 3 Haiku** (`bedrock/anthropic.claude-3-haiku-20240307-v1:0`)

### Anthropic Vision Models (Direct API)

- **Claude Opus 4** (`claude-opus-4-20250514`) - Most capable and intelligent model
- **Claude Sonnet 4** (`claude-sonnet-4-20250514`) - High-performance with exceptional reasoning
- **Claude 3.7 Sonnet** (`claude-3-7-sonnet-20250219`) - Latest with extended thinking
- **Claude 3.5 Sonnet** (`claude-3-5-sonnet-20241022`) - Enhanced vision capabilities
- **Claude 3.5 Haiku** (`claude-3-5-haiku-20241022`) - Fast vision processing
- **Claude 3 Opus** (`claude-3-opus-20240229`) - Most capable vision model
- **Claude 3 Sonnet** (`claude-3-sonnet-20240229`) - Balanced performance
- **Claude 3 Haiku** (`claude-3-haiku-20240307`) - Fast vision processing

> **📈 Latest Models:** This documentation is updated with the latest available vision models as of 2025. All model names and capabilities are sourced from official provider documentation and LiteLLM compatibility matrix to ensure accuracy and up-to-date information.

## 📄 Supported File Types

Quantalogic PyZeroX supports a wide range of document formats:

**Document Formats:**
- PDF, DOC, DOCX, RTF, TXT
- ODT, OTT (OpenDocument)
- HTML, HTM, XML
- WPS, WPD (WordPerfect)

**Spreadsheet Formats:**
- XLS, XLSX (Excel)
- ODS, OTS (OpenDocument)
- CSV, TSV

**Presentation Formats:**
- PPT, PPTX (PowerPoint)
- ODP, OTP (OpenDocument)

**Image Formats:**
- PNG, JPG, JPEG, TIFF, BMP
- SVG, WEBP

## 💡 Examples

### Data Extraction Example

```typescript
import { zerox } from "zerox";

const result = await zerox({
  filePath: "invoice.pdf",
  extractOnly: true,
  schema: {
    type: "object",
    properties: {
      invoice_number: { type: "string" },
      date: { type: "string" },
      total: { type: "number" },
      items: {
        type: "array",
        items: {
          type: "object",
          properties: {
            name: { type: "string" },
            price: { type: "number" },
            quantity: { type: "number" }
          }
        }
      }
    }
  },
  credentials: {
    apiKey: process.env.OPENAI_API_KEY,
  },
});
```

### Batch Processing Example

```python
import asyncio
from pyzerox import zerox
import os

async def process_documents(file_paths):
    results = []
    for file_path in file_paths:
        result = await zerox(
            file_path=file_path,
            model="gpt-4o-mini",
            output_dir="./processed"
        )
        results.append(result)
    return results

# Process multiple documents
files = ["doc1.pdf", "doc2.pdf", "doc3.pdf"]
results = asyncio.run(process_documents(files))
```

### Format Preservation Example

```typescript
// For documents with complex tables spanning multiple pages
const result = await zerox({
  filePath: "financial-report.pdf",
  maintainFormat: true, // Slower but better for tables
  concurrency: 1, // Required for maintainFormat
  credentials: {
    apiKey: process.env.OPENAI_API_KEY,
  },
});
```

## 🔧 Development

### Project Structure

```
quantalogic-pyzerox/
├── py_zerox/                 # Python package
│   ├── pyzerox/             # Main Python module
│   │   ├── core/            # Core processing logic
│   │   ├── models/          # Data models
│   │   └── processor/       # Document processors
│   └── tests/               # Python tests
├── node-zerox/              # Node.js package
│   ├── src/                 # TypeScript source
│   │   ├── models/          # Model definitions
│   │   └── utils/           # Utility functions
│   └── tests/               # Node.js tests
├── docs/                    # Documentation
├── examples/                # Example code
└── shared/                  # Shared resources
```

### Building from Source

```bash
# Clone the repository
git clone https://github.com/quantalogic/quantalogic-pyzerox.git
cd quantalogic-pyzerox

# Install dependencies
make install

# Build packages
make build

# Run tests
make test

# Run linting
make lint
```

### Testing

```bash
# Python tests
poetry run pytest py_zerox/tests/

# Node.js tests
cd node-zerox && npm test

# Integration tests
make test-integration
```

## 📚 Documentation

For detailed documentation, see the [`docs/`](docs/) directory:

- [Project Overview](docs/project-overview.md) - Purpose, stack, platform support
- [Architecture](docs/architecture.md) - System structure, data flow, key files
- [Build System](docs/build-system.md) - Build configs, workflows, troubleshooting
- [Testing](docs/testing.md) - Test types, commands, organization
- [Development](docs/development.md) - Code style, patterns, workflows
- [Deployment](docs/deployment.md) - Packaging, scripts, output locations
- [Files Catalog](docs/files.md) - File groups, entry points, dependencies

## 🤝 Contributing

We welcome contributions! Please see our [Contributing Guide](CONTRIBUTING.md) for details.

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests for new functionality
5. Ensure all tests pass
6. Submit a pull request

## 📜 License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## 🙏 Credits

This project is a maintained fork of the original [ZeroX](https://github.com/getomni-ai/zerox) by [Omni AI](https://github.com/getomni-ai). We're grateful for their foundational work and continue to build upon their vision.

- **Original ZeroX Project**: [getomni-ai/zerox](https://github.com/getomni-ai/zerox) - The original OCR and document processing toolkit
- [LiteLLM](https://github.com/BerriAI/litellm) - Powers our Python SDK with multi-provider support
- Original PyZeroX project contributors
- The open-source community for inspiration and feedback

---

**Made with ❤️ by the [Quantalogic](https://www.quantalogic.app) team** - Advancing AI-powered document processing and workflow automation.

*Originally based on [ZeroX](https://github.com/getomni-ai/zerox) by Omni AI*
