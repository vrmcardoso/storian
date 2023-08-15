import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["display", "edit", "hideOnToggle", "showOnToggle"];

  toggle(event) {
    event.preventDefault();

    this.displayTarget.classList.toggle("d-none");
    this.editTarget.classList.toggle("d-none");

    this.hideOnToggleTargets.forEach((el) => {
      el.classList.toggle("d-none");
    });

    this.showOnToggleTargets.forEach((el) => {
      el.classList.toggle("d-none");
    });

    if (!this.editTarget.classList.contains("d-none")) {
      console.log("initializing TinyMCE");
      this.initializeTinyMCE();
    }
  }

  submit(event) {
    event.preventDefault();
    this.updateTextArea();
    this.editTarget.querySelector("form.content-edit-form").submit();
  }

  updateTextArea() {
    const textarea = this.editTarget.querySelector('textarea.tinymce');
    const editorContent = tinymce.get(textarea.id).getContent();
    textarea.value = editorContent;
  }

  initializeTinyMCE() {
    tinymce.init({
      selector: 'textarea.tinymce',
      plugins: 'anchor autolink charmap codesample emoticons image link lists media searchreplace table visualblocks wordcount',
      toolbar: 'undo redo | blocks fontfamily fontsize | bold italic underline strikethrough | link image media table mergetags | addcomment showcomments | spellcheckdialog a11ycheck typography | align lineheight | checklist numlist bullist indent outdent | emoticons charmap | removeformat',
      tinycomments_mode: 'embedded',
      tinycomments_author: 'Author name',
    });
  }
}
