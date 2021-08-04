const COMMIT_AVAILABLE_TYPES = ['fix', 'feat', 'chore', 'refactor', 'docs', 'ci'];

module.exports = {
  extends: ['@commitlint/config-conventional'],
  parserPreset: './parser-preset',
  rules: {
    'body-max-line-length': [0, 'always', 150],
    'type-enum': [2, 'always', COMMIT_AVAILABLE_TYPES],
    'scope-empty': [2, 'never'],
    'header-max-length': [0, 'always', 100],
  },
};

