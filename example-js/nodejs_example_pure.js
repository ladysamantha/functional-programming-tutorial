// pure function since we only operate on the contents
// also, split is immutable since it doesn't mutate the original string
const getWords = (contents) => contents.split(/[\s.,\/:\n]+/);

/**
 * I'd argue this isn't a pure function since it's directly
 * muating the tally object. But this was the example given
 * @arg {Array} words
 * @return {Object}
 */
const getTally = (words) =>
  words
    .map((word) => word.toLowerCase())
    .reduce((tally, word) => {
      tally[word] = (tally[word] || 0) + 1;
      return tally;
    }, {});

/**
 * @arg {Number} n
 * @arg {Array} array
 * @return {Array}
 */
const take = (n, array) => array.slice(0, n);

const sortTally = (tally) => Object.keys(tally)
  .map((word) => ({ word, count: tally[word] }))
  .sort((a, b) => b.count - a.count);

(() => {
  // this is the "main" function
  // this is meant to be impure
  // we'll keep all impure functions here
  const fs = require('fs');
  const getContents = (file) => fs.readFileSync(file, 'utf8');
  /**
   * @arg {Array} results
   */
  const printTable = (results) => {
    console.log('#RESULT -> WORD: COUNT');
    results.forEach((tally, i) => {
      console.log(`#${i+1} -> ${tally.word}: ${tally.count}`);
    });
  };
  printTable(take(10, sortTally(getTally(getWords(getContents('leaves.txt'))))));
})();
