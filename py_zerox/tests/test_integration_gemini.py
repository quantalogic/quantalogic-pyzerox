
import os
import pytest
import asyncio
from pyzerox import zerox



ASSET_PATHS = [
    os.path.abspath(os.path.join(os.path.dirname(__file__), '../../assets/cs101.pdf')),
    os.path.abspath(os.path.join(os.path.dirname(__file__), '../../assets/test_image.pdf')),
]
MODEL_NAME = "gemini/gemini-2.5-flash"


import pytest

@pytest.mark.integration
@pytest.mark.parametrize("asset_path", ASSET_PATHS)
def test_gemini_flash_on_pdf(asset_path):
    """
    Integration test: process PDF with Gemini 2.5 Flash model.
    """
    assert os.path.exists(asset_path), f"Test asset not found: {asset_path}"
    # Run the async zerox function
    result = asyncio.run(zerox(file_path=asset_path, model=MODEL_NAME))
    from pyzerox.core.types import ZeroxOutput
    assert isinstance(result, ZeroxOutput)
    assert hasattr(result, 'pages')
    assert isinstance(result.pages, list)
    assert len(result.pages) > 0
    # Check that at least one page has non-empty content
    non_empty_pages = [p for p in result.pages if hasattr(p, 'content') and isinstance(p.content, str) and p.content.strip()]
    assert len(non_empty_pages) > 0, "No non-empty page content found."
    # Write the output to a file alongside the source file
    output_dir = os.path.dirname(asset_path)
    base_name = os.path.splitext(os.path.basename(asset_path))[0]
    output_path = os.path.join(output_dir, f"{base_name}_gemini_output.md")
    with open(output_path, "w", encoding="utf-8") as f:
        for page in result.pages:
            f.write(f"# Page {getattr(page, 'page', '?')}\n\n{page.content}\n\n")
    print(f"Output written to: {output_path}")
    # Print a sample of the first non-empty page
    print(f"Sample output for {os.path.basename(asset_path)}:", non_empty_pages[0].content[:300])
