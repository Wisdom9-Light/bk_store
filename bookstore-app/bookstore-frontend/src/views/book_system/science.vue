<template>
  <div class="page">
    <header class="hero">
      <div>
        <p class="eyebrow">Science collection</p>
        <h1>Every discovery, personally chosen.</h1>
        <p class="hero-copy">
          Explore precise, practical, and inspiring science titles curated to fuel
          curiosity and innovation.
        </p>
        <div class="hero-actions">
          <button class="cta-primary" type="button">View curators</button>
          <button class="cta-secondary" type="button">Explore catalog</button>
        </div>
      </div>
      <div class="hero-panel">
        <div>
          <span class="stat">742</span>
          <p>Books curated</p>
        </div>
        <div>
          <span class="stat">4.9 ★</span>
          <p>Community rating</p>
        </div>
        <div>
          <span class="stat">18</span>
          <p>Curators</p>
        </div>
      </div>
    </header>

    <section class="toolbar">
      <p>Science books • {{ books.length }} titles</p>
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
import advancedCalculus from "../../assets/images/Science/Advanced Calculus, James J. Callahan.jpeg"
import biobuilder from "../../assets/images/Science/BioBuilder_ Synthetic Biology in the Lab.jpeg"
import cleanCode from "../../assets/images/Science/Clean Code, Robert C. Martin.jpeg"
import computerScience from "../../assets/images/Science/Computer Science, Allen B. Tucker.jpeg"
import howComputersWork from "../../assets/images/Science/How Computers Work_ Microprocessor and Main Memory, Roger Young.jpeg"
import mathematicsEveryman from "../../assets/images/Science/Mathematics for everyman, Egmont Colerus.jpeg"
import mechatronics from "../../assets/images/Science/Mechatronics, William Bolton.jpeg"
import naturesMachines from "../../assets/images/Science/Nature's Machines_ An Introduction To Organismal Biomechanics, David E. Alexander.jpeg"
import softwareEngineering from "../../assets/images/Science/Software Engineering, Ravi Sethi.jpeg"
import chemistryBook from "../../assets/images/Science/The Chemistry Book, Derek B. Lowe.jpeg"
import goldenRatio from "../../assets/images/Science/The Golden Ratio The Divine Beauty of Mathematics, Garry Meisner.jpeg"

const books = [
  { title: 'Advanced Calculus', author: 'James J. Callahan', price: '$53.66', image: advancedCalculus },
  { title: 'BioBuilder', author: 'Unknown', price: '$37.12', image: biobuilder },
  { title: 'Clean Code', author: 'Robert C. Martin', price: '$9.88', image: cleanCode },
  { title: 'Computer Science', author: 'Allen B. Tucker', price: '$81.96', image: computerScience },
  { title: 'How Computers Work', author: 'Roger Young', price: '$19.99', image: howComputersWork },
  { title: 'Mathematics for Everyman', author: 'Egmont Colerus', price: '$26.37', image: mathematicsEveryman },
  { title: 'Mechatronics', author: 'William Bolton', price: '$62.73', image: mechatronics },
  { title: "Nature's Machines", author: 'David E. Alexander', price: '$19.99', image: naturesMachines },
  { title: 'Software Engineering', author: 'Ravi Sethi', price: '$37.26', image: softwareEngineering },
  { title: 'The Chemistry Book', author: 'Derek B. Lowe', price: '$73.62', image: chemistryBook },
  { title: 'The Golden Ratio', author: 'Garry Meisner', price: '$19.99', image: goldenRatio }
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
