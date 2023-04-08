const { environment } = require('@rails/webpacker')

module.exports = environment

const { environment } = require('@rails/webpacker');

const sassLoader = {
  test: /\.scss$/,
  use: [
    'style-loader',
    'css-loader',
    'sass-loader',
  ],
};

environment.loaders.append('sass', sassLoader);
module.exports = environment;

