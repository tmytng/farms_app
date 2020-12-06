import { ValidationProvider, extend, localize } from "vee-validate";
import { required, max } from "vee-validate/dist/rules";
import ja from "vee-validate/dist/locale/ja.json";

extend("required", {
  ...required
});

extend("max", {
  ...max
});

localize("ja", ja);
