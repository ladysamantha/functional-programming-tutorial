// Adapted from https://github.com/airportyh/word-count/blob/master/1.imperative.js
const fs = require('fs');

// Steps
// 1. Read a file with UTF-8 text

const text = fs.readFileSync('leaves.txt', 'utf8');

// 2. Break everything up into words
const words = text.split(/[\s.,\/:\n]+/);

// We'll keep tally in a "dictionary"
const tally = {};

for(let i = 0; i < words.length; i++) {
  const word = words[i].toLowerCase();

  // The original used a "|| 0" Javascript-ism
  // I'm using this since it's clearer
  // , and since I'm interested in counting line differences as
  // a massive factor
  if(tally[word]) {
    ++tally[word];
  } else {
    tally[word] = 1;
  }
}

// 3. Display the top-10 words
const finalTally = [];
for(let word in tally) {
  finalTally.push({ word, count: tally[word] });
}
finalTally.sort((a, b) => b.count - a.count);
const top10 = finalTally.slice(0, 10);

console.log('#RANK -> WORD: COUNT');
console.log('+++++++++++++++++++++++++++++++++++++++++++++');

for(let j = 0; j < top10.length; j++) {
  console.log(`#${j + 1} -> ${top10[j].word}: ${top10[j].count}`);
}

