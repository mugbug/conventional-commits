module.exports = {
  parserOpts: {
    headerPattern: /^(\w*)(?:\((\w+\D\-\d+|release)\))!?:(.*)$/,
    headerCorrespondence: ['type', 'scope', 'subject'],
  },
};

