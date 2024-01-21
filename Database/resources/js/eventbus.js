// eventBus.js
import { ref } from 'vue';

export const EventBus = {
  data: ref({}),
  emit(event, ...args) {
    if (!this.data[event]) return;
    this.data[event].forEach(callback => callback(...args));
  },
  on(event, callback) {
    if (!this.data[event]) {
      this.data[event] = [];
    }
    this.data[event].push(callback);
  },
  off(event, callback) {
    if (!this.data[event]) return;
    if (!callback) {
      this.data[event] = [];
      return;
    }
    this.data[event] = this.data[event].filter(cb => cb !== callback);
  }
};
