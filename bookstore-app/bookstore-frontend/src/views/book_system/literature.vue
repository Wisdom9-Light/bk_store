<template>
  <div class="page">
    <header class="hero">
      <div>
        <p class="eyebrow">Literature collection</p>
        <h1>Every book, personally chosen.</h1>
        <p class="hero-copy">
          Explore stories from every corner of the globe, from timeless classics to
          modern epics curated by our editors.
        </p>
        <div class="hero-actions">
          <button class="cta-primary" type="button">View curators</button>
          <button class="cta-secondary" type="button">Explore catalog</button>
        </div>
      </div>
      <div class="hero-panel">
        <div>
          <span class="stat">1.2k</span>
          <p>Stories listed</p>
        </div>
        <div>
          <span class="stat">4.7 ★</span>
          <p>Reader rating</p>
        </div>
        <div>
          <span class="stat">28</span>
          <p>Curators</p>
        </div>
      </div>
    </header>

    <section class="toolbar">
      <p>Literature books • {{ books.length }} titles</p>
      <div class="filters">
        <button type="button">Filter by category</button>
        <button type="button">Filter by curator</button>
      </div>
    </section>

    <section class="grid">
      <article v-for="book in books" :key="book.title" class="card">
        <img :src="book.image" :alt="book.title" />
        <div class="card-body">
          <h3>{{ book.title }}</h3>
          <p>{{ book.author }}</p>
          <span class="price">{{ book.price }}</span>
        </div>
      </article>
    </section>
  </div>
</template>

<script setup>
import newWorld from "../../assets/images/Literature/A New World Begins_ The History of the French Revolution, Jeremy D. Popkin.jpeg"
import africaUnite from "../../assets/images/Literature/Africa Must Unite, Kwanme Nkrumah.jpeg"
import ancientChina from "../../assets/images/Literature/Ancient China _ Chinese Civilization from the Origins to Tang Dynasty, Maurizo Scarpari.jpeg"
import arabicPhilosophy from "../../assets/images/Literature/Arabic Philosophy, Peter Adamson & Richard Taylor.jpeg"
import decolonising from "../../assets/images/Literature/Decolonising the  Mind, Ngugi Wa Thiong'o.jpeg"
import redChamber from "../../assets/images/Literature/Dream of the Red Chamber, Cao Xueqin.jpeg"
import hpChamber from "../../assets/images/Literature/Harry Potter and the Chambers of Secrets, J.K. Rowling.jpeg"
import hpStone from "../../assets/images/Literature/Harry Potter and the Philosopher Stone, J.K. Rowling.jpeg"
import heirProphecy from "../../assets/images/Literature/Heir of Prophecy, Analeigh Sbrana.jpeg"
import loot from "../../assets/images/Literature/Loot, Sharon Waxman.jpeg"
import oralLiterature from "../../assets/images/Literature/Oral Literature In Africa _ Finnegan, Ruth _ Free Download, Borrow, and Streaming _ Internet Archive.jpeg"
import rayasLegacy from "../../assets/images/Literature/Rayas Colony Legacy, Ginger Booth.jpeg"
import soulMountain from "../../assets/images/Literature/Soul Mountain, Gao Xingjian.jpeg"
import artListening from "../../assets/images/Literature/The Art of Listening, Eric Fromm.jpeg"
import artWar from "../../assets/images/Literature/The Art of War, Sun Tzu.jpeg"
import bridgeKingdom from "../../assets/images/Literature/The Bridge Kingdom, Danielle Jensen.jpeg"
import floatingWorld from "../../assets/images/Literature/The Floating World, Axie Oh.jpeg"
import hiddenTreasure from "../../assets/images/Literature/The Hidden Treasure of Timbuktu, Thames & Hudson.jpeg"
import kingdomWaalo from "../../assets/images/Literature/The Kingdom Waalo, Boubacar Barry.jpeg"
import philosophyLanguage from "../../assets/images/Literature/The Philosophy of Language, A. P. Martinich.jpeg"
import untoldHistory from "../../assets/images/Literature/The Untold History of Polymaths - Graham Hancock Official Website.jpeg"
import villainFellFirst from "../../assets/images/Literature/The Villain Fell First,Mira Ellery.jpeg"
import wealthNations from "../../assets/images/Literature/The Wealth of Nations, Adam Smith.jpeg"

const books = [
  { title: 'A New World Begins', author: 'Jeremy D. Popkin', price: '$19.99', image: newWorld },
  { title: 'Africa Must Unite', author: 'Kwanme Nkrumah', price: '$28.42', image: africaUnite },
  { title: 'Ancient China', author: 'Maurizo Scarpari', price: '$19.99', image: ancientChina },
  { title: 'Arabic Philosophy', author: 'Peter Adamson', price: '$53.68', image: arabicPhilosophy },
  { title: 'Decolonising the Mind', author: "Ngugi Wa Thiong'o", price: '$90.91', image: decolonising },
  { title: 'Dream of the Red Chamber', author: 'Cao Xueqin', price: '$33.99', image: redChamber },
  { title: 'Harry Potter: Chamber of Secrets', author: 'J.K. Rowling', price: '$87.00', image: hpChamber },
  { title: 'Harry Potter: Philosopher Stone', author: 'J.K. Rowling', price: '$35.42', image: hpStone },
  { title: 'Heir of Prophecy', author: 'Analeigh Sbrana', price: '$37.19', image: heirProphecy },
  { title: 'Loot', author: 'Sharon Waxman', price: '$199.00', image: loot },
  { title: 'Oral Literature in Africa', author: 'Ruth Finnegan', price: '$202.77', image: oralLiterature },
  { title: 'Rayas Colony Legacy', author: 'Ginger Booth', price: '$44.00', image: rayasLegacy },
  { title: 'Soul Mountain', author: 'Gao Xingjian', price: '$72.72', image: soulMountain },
  { title: 'The Art of Listening', author: 'Eric Fromm', price: '$15.51', image: artListening },
  { title: 'The Art of War', author: 'Sun Tzu', price: '$11.87', image: artWar },
  { title: 'The Bridge Kingdom', author: 'Danielle Jensen', price: '$300.88', image: bridgeKingdom },
  { title: 'The Floating World', author: 'Axie Oh', price: '$76.56', image: floatingWorld },
  { title: 'Hidden Treasure of Timbuktu', author: 'Thames & Hudson', price: '$493.64', image: hiddenTreasure },
  { title: 'The Kingdom Waalo', author: 'Boubacar Barry', price: '$72.58', image: kingdomWaalo },
  { title: 'The Philosophy of Language', author: 'A. P. Martinich', price: '$28.55', image: philosophyLanguage },
  { title: 'Untold History of Polymaths', author: 'Graham Hancock', price: '$19.99', image: untoldHistory },
  { title: 'The Villain Fell First', author: 'Mira Ellery', price: '$49.99', image: villainFellFirst },
  { title: 'The Wealth of Nations', author: 'Adam Smith', price: '$94.44', image: wealthNations }
]
</script>

<style scoped>
:root {
  color-scheme: light;
}

.page {
  min-height: 100vh;
  padding: 40px 24px 64px;
  background: radial-gradient(circle at top left, rgba(243, 113, 0, 0.25) 0%, transparent 45%),
    radial-gradient(circle at 80% 0%, rgba(217, 34, 0, 0.35) 0%, transparent 55%),
    linear-gradient(160deg, #5a0006 0%, #920004 35%, #d92200 70%, #f37100 100%);
  color: #fff7f1;
  font-family: "Inter", "Segoe UI", system-ui, sans-serif;
}

.hero {
  display: grid;
  grid-template-columns: minmax(260px, 1.4fr) minmax(220px, 1fr);
  gap: 28px;
  margin-bottom: 32px;
}

.eyebrow {
  text-transform: uppercase;
  letter-spacing: 0.18em;
  font-size: 11px;
  opacity: 0.8;
  margin: 0 0 12px;
}

.hero h1 {
  margin: 0 0 16px;
  font-size: 32px;
}

.hero-copy {
  margin: 0 0 20px;
  color: rgba(255, 247, 241, 0.85);
  line-height: 1.6;
}

.hero-actions {
  display: flex;
  gap: 12px;
  flex-wrap: wrap;
}

.cta-primary,
.cta-secondary {
  border: none;
  border-radius: 999px;
  padding: 10px 18px;
  font-weight: 600;
  cursor: pointer;
}

.cta-primary {
  background: #fff7f1;
  color: #5a0006;
}

.cta-secondary {
  background: rgba(255, 255, 255, 0.15);
  color: #fff7f1;
}

.hero-panel {
  background: rgba(255, 255, 255, 0.12);
  border-radius: 24px;
  padding: 20px;
  display: grid;
  gap: 12px;
  box-shadow: 0 18px 36px rgba(0, 0, 0, 0.2);
}

.hero-panel div {
  background: rgba(255, 255, 255, 0.16);
  border-radius: 16px;
  padding: 12px 14px;
}

.stat {
  font-size: 20px;
  font-weight: 700;
}

.toolbar {
  display: flex;
  justify-content: space-between;
  align-items: center;
  gap: 16px;
  margin-bottom: 20px;
  font-size: 13px;
  text-transform: uppercase;
  letter-spacing: 0.14em;
}

.filters {
  display: flex;
  gap: 12px;
}

.filters button {
  border: 1px solid rgba(255, 255, 255, 0.35);
  background: rgba(255, 255, 255, 0.12);
  color: #fff7f1;
  border-radius: 999px;
  padding: 8px 16px;
  font-size: 11px;
  letter-spacing: 0.12em;
  text-transform: uppercase;
}

.grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
  gap: 18px;
}

.card {
  background: rgba(255, 255, 255, 0.1);
  border-radius: 20px;
  overflow: hidden;
  display: grid;
  grid-template-rows: 200px auto;
  box-shadow: 0 16px 32px rgba(0, 0, 0, 0.2);
}

.card img {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

.card-body {
  padding: 14px 16px 16px;
  display: grid;
  gap: 6px;
}

.card-body h3 {
  margin: 0;
  font-size: 15px;
}

.card-body p {
  margin: 0;
  color: rgba(255, 247, 241, 0.75);
  font-size: 13px;
}

.price {
  font-weight: 600;
  color: #fff2ea;
}

@media (max-width: 900px) {
  .hero {
    grid-template-columns: 1fr;
  }

  .toolbar {
    flex-direction: column;
    align-items: flex-start;
  }
}
</style>
