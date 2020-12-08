<template>
  <ValidationProvider
    :name="$attrs.label"
    :rules="rules"
    v-slot="{ errors, valid }"
  >
    <v-file-input
      accept="image/*"
      label="File input"
      :error-messages="errors"
      :success="valid"
    ></v-file-input>
  </ValidationProvider>
</template>

<script>
export default {

}
</script>
<style>

</style>
