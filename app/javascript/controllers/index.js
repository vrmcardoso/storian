// Load all the controllers within this directory and all subdirectories.
// Controller files must be named *_controller.js.

import { application } from "./application"

import BackgroundController from "./background_controller"
application.register("background", BackgroundController)

import BackButtonController from "./backbutton_controller"
application.register("backbutton", BackButtonController)

import BookFormController from "./book_form_controller";
application.register("book-form", BookFormController);
