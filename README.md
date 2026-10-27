# DevOps Pipeline

A small Node.js command-line tool that converts Markdown files into HTML.

## Requirements

- Node.js 20 or newer
- npm

## Usage

Build a Markdown file into HTML:

    npm run build -- src/notes.md out/notes.html

Run tests:

    npm test

Run the CI pipeline:

    make ci

## Dependencies

- markdown-it: Converts Markdown into HTML.

## Project Structure

- `src/`: Source Markdown files
- `out/`: Generated HTML output
- `build.js`: Build script
- `test.js`: Test script
- `package.json`: Project metadata and npm scripts
- `package-lock.json`: Locked dependency versions
- `makefile`: Build and CI automation
