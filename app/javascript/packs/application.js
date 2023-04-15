import 'bootstrap';
import '../stylesheets/bootstrap.scss';
import { createPopper } from '@popperjs/core';

window.createPopper = createPopper; // Make Popper available globally

import Turbolinks from 'turbolinks';
Turbolinks.start();

import Rails from '@rails/ujs';
Rails.start();

import { Application } from 'stimulus';
import { definitionsFromContext } from 'stimulus/webpack-helpers';

const application = Application.start();
const context = require.context('../controllers', true, /\.js$/);
application.load(definitionsFromContext(context));

import "controllers";
