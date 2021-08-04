module.exports = {
  parserOpts: {
    headerPattern: /^(\w*)(?:\((\w+\D\-\d+)\))!?:(.*)$/,
    headerCorrespondence: ['type', 'scope', 'subject'],
  },
};

