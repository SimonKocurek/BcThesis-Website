const Automerge = require('automerge');

let doc1 = Automerge.init();

doc1 = Automerge.change(doc1, 'Initialize card list', doc => {
  doc.cards = [];
});

doc1 = Automerge.change(doc1, 'Add card', doc => {
  doc.cards.push({title: 'Rewrite everything in Clojure', done: false});
});

doc1 = Automerge.change(doc1, 'Add another card', doc => {
  doc.cards.insertAt(0, {title: 'Rewrite everything in Haskell', done: false});
});
