<template>
  <div>
    <LikeHeader>
      <h1>こんにちは</h1>
    </LikeHeader>
    <LikeNumber :total-number="number"></LikeNumber>
    <button @click="currentComponent = 'Home'">Home</button>
    <button @click="currentComponent = 'About'">About</button>
    <component :is="currentComponent"></component>
    <h2>イベントのフォーム</h2>
    <EventTitle v-model="eventData.title"></EventTitle>
    <label for="maxNumber">最大人数</label>
    <input id="maxNumber" type="number" v-model.number="eventData.maxNumber" />
    <pre>{{ eventData.maxNumber }}</pre>

    <label for="host">主催者</label>
    <input id="host" type="text" v-model.trim="eventData.host" />
    <pre>{{ eventData.host }}</pre>

    <label for="detail">内容</label>
    <textarea
      id="detail"
      cols="30"
      rows="10"
      v-model="eventData.detail"
    ></textarea>
    <p style="white-space: pre">{{ eventData.detail }}</p>

    <input type="checkbox" id="isPrivate" v-model="eventData.isPrivate" />
    <label for="isPrivate">非公開</label>
    <p>{{ eventData.isPrivate }}</p>

    <p>参加条件</p>
    <input type="checkbox" id="10" value="10代" v-model="eventData.target" />
    <label for="10">10代</label>

    <input type="checkbox" id="20" value="20代" v-model="eventData.target" />
    <label for="20">20代</label>

    <input type="checkbox" id="30" value="30代" v-model="eventData.target" />
    <label for="30">30代</label>
    <p> {{eventData.target}}</p>
  </div>
</template>

<script>
import LikeHeader from "./packs/components/LikeHeader.vue";
import About from "./packs/components/About.vue";
import Home from "./packs/components/Home.vue";
import EventTitle from "./packs/components/EventTitle.vue";

export default {
  data() {
    return {
      number: 14,
      currentComponent: "Home",
      eventData: {
        title: "タイトル",
        maxNumber: 0,
        host: "",
        detail: "",
        isPrivate: false,
        target: []
      },
    };
  },
  components: {
    LikeHeader: LikeHeader,
    Home: Home,
    About: About,
    EventTitle: EventTitle
  },

  Aboutmethods: {
    incrementNumber(value) {
      this.number = value;
    },
  },
};
</script>
