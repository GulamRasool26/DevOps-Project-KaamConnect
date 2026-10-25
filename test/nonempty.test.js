const test = require('node:test');
const assert = require('node:assert');
const fs = require('fs');
const path = require('path');

test('no built page is empty', () => {
  const dir = path.join(__dirname, '..', 'out');
  const pages = fs.readdirSync(dir).filter(f => f.endsWith('.html'));
  assert.ok(pages.length > 0, 'no pages were built');
  for (const f of pages) {
    assert.ok(fs.statSync(path.join(dir, f)).size > 0, f + ' is empty');
  }
});
