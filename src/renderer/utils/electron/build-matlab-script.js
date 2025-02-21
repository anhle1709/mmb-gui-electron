import logger from '@/utils/logger';

function toVector(selected, length) {
  const arr = (new Array(length)).fill(0);

  selected.forEach((s) => {
    arr[s.id - 1] = 1;
  });

  return `[${arr.join(' ')}]`;
}

function userRuleToMatrix(userRule) {
  const rows = userRule.map(row => row
    .map(num => (num === null ? NaN : +num))
    .join(','));

  const contents = rows.join(';');

  return `'[${contents}]'`;
}

export default function buildMatlabScript(models, rules, output, shocks, horizon, userRule) {
  // todo: fix hardcoded vector lengths

  const moreArgs = {
    horizon: `'${horizon}'`,
  };

  if (rules.find(r => r.id === 1 /* user specified rule */)) {
    moreArgs.data = userRuleToMatrix(userRule);
  }

  const argString = Object.keys(moreArgs).map(key => `'${key}', ${moreArgs[key]}`).join(', ');

  // todo: fix hardcoded vector lengths
  const lines = [
    'try',
    `  models = ${toVector(models, 128)}`,
    `  rules = ${toVector(rules, 11)}`,
    `  output = ${toVector(output, 3)}`,
    `  shocks = ${toVector(shocks, 2)}`,
    `  CMD_MMB(models,rules,output,shocks, ${argString})`,
    'catch ERR',
    '  disp(\'\')',
    '  disp(\'An error occured:\')',
    '  disp(ERR)',
    'end',
    'exit()',
  ];

  // macOS somehow struggles with newlines in args, use semicolons
  const result = lines.join(';');

  logger.info(result);

  return result;
}
