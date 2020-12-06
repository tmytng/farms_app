<template>
<v-container>
  <v-row>
    <v-col cols="12" sm="6" md="4" lg="3">
    <SaleGraph />
    </v-col>
    <v-col cols="12" sm="6" md="4" lg="3">
    <SaleGraph />
    </v-col>
    <v-col cols="12" sm="6" md="4" lg="3">
    <SaleGraph />
    </v-col>
    <v-col cols="12" sm="6" md="4" lg="3">
    <SaleGraph />
    </v-col>
  </v-row>
  <Calc />
</v-container>
</template>

<script>
import SaleGraph from '../components/SaleGraph'
import Calc from './Calc'

export default {
  components: {
    SaleGraph,
    Calc
  },
};
</script>

<style scoped>
</style>
