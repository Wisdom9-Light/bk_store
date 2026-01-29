<template>
  <div class="page">
    <header class="hero">
      <div>
        <p class="eyebrow">Arts collection</p>
        <h1>Every art book, personally curated.</h1>
        <p class="hero-copy">
          Discover bold visual stories, design inspirations, and timeless art references
          curated for curious creators.
        </p>
        <div class="hero-actions">
          <button class="cta-primary" type="button">Browse curators</button>
          <button class="cta-secondary" type="button">Explore catalog</button>
        </div>
      </div>
      <div class="hero-panel">
        <div>
          <span class="stat">568</span>
          <p>Books shipped</p>
        </div>
        <div>
          <span class="stat">4.8 ★</span>
          <p>Average rating</p>
        </div>
        <div>
          <span class="stat">12</span>
          <p>Curators</p>
        </div>
      </div>
    </header>

    <section class="toolbar">
      <p>Art books • {{ books.length }} titles</p>
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
import artForms from '../../assets/images/Arts/Art Forms in Nature, Ernst Haeckel.jpeg'
import artPhysics from '../../assets/images/Arts/Art and Physics - Parallel Visions in Space Time, Leonard Shlain.jpeg'
import becomingArtist from '../../assets/images/Arts/Becoming an Artist, Scott Christian Sava.jpeg'
import hundredHands from '../../assets/images/Arts/Book of a Hundred Hands, George B. Bridgman.jpeg'

const books = [
  {
    title: 'Art Forms in Nature',
    author: 'Ernst Haeckel',
    price: '$45.99',
    image: artForms
  },
  {
    title: 'Art and Physics',
    author: 'Leonard Shlain',
    price: '$59.09',
    image: artPhysics
  },
  {
    title: 'Becoming an Artist',
    author: 'Scott Christian Sava',
    price: '$19.99',
    image: becomingArtist
  },
  {
    title: 'Book of a Hundred Hands',
    author: 'George B. Bridgman',
    price: '$33.86',
    image: hundredHands
  }
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
