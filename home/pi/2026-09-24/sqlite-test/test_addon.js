const addon = require('./build/Release/test_addon.node');

console.log('Calling native runQuery...');
addon.runQuery((err) => {
  if (err) {
    console.error('Error:', err);
  } else {
    console.log('Native call finished.');
  }
});
