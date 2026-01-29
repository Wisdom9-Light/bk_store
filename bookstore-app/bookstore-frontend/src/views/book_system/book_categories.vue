<template>
  <div class="page">
    <header class="topbar">
      <div class="brand">
        <span class="logo">BS</span>
        <div>
          <h1>Bookoo</h1>
          <p>Curated shelves, bold flavors</p>
        </div>
      </div>
      <nav class="nav-links">
        <router-link to="/books">Books</router-link>
        <router-link to="/books/order">Orders</router-link>
        <router-link class="primary-link" to="/customer/account">Account</router-link>
      </nav>
    </header>

    <section class="hero">
      <div class="hero-text">
        <p class="eyebrow">Discover categories</p>
        <h2>Find your next read by vibe</h2>
        <p class="subtext">
          From modern literature to hands-on science, explore curated collections with
          vibrant picks and timeless classics.
        </p>
        <div class="hero-actions">
          <button class="cta-primary" type="button">Browse now</button>
          <button class="cta-secondary" type="button">Explore deals</button>
        </div>
      </div>
      <div class="hero-card">
        <div class="hero-badge">Top rated</div>
        <h3>Staff Picks</h3>
        <p>Handpicked titles refreshed weekly.</p>
        <div class="hero-meta">
          <span>4.8 ★</span>
          <span>120+ books</span>
        </div>
        <button class="hero-cta" type="button">View collection</button>
      </div>
    </section>

    <section class="category-section">
      <div class="section-header">
        <h3>Categories</h3>
        <p>Browse by theme, mood, or discipline.</p>
      </div>
      <div class="category-grid">
        <router-link class="category-card" to="/books/art">
          <div class="category-tag">Arts</div>
          <h4>Creative Arts</h4>
          <p>Design, illustration, and visual storytelling.</p>
          <span class="card-btn">Explore</span>
        </router-link>
        <router-link class="category-card" to="/books/literature">
          <div class="category-tag">Literature</div>
          <h4>Modern Literature</h4>
          <p>Global voices, classic epics, and new releases.</p>
          <span class="card-btn">Explore</span>
        </router-link>
        <router-link class="category-card" to="/books/science">
          <div class="category-tag">Science</div>
          <h4>Empirical Science</h4>
          <p>Research-backed knowledge and lab-ready reads.</p>
          <span class="card-btn">Explore</span>
        </router-link>
      </div>
    </section>
  </div>
</template>

<script setup></script>

<style scoped>
:root {
  color-scheme: light;
}

.page {
  min-height: 100vh;
  padding: 28px 26px 64px;
  background: radial-gradient(circle at top left, rgba(243, 113, 0, 0.25) 0%, transparent 45%),
    radial-gradient(circle at 75% -10%, rgba(217, 34, 0, 0.25) 0%, transparent 45%),
    linear-gradient(180deg, #fff7f1 0%, #ffe8d5 40%, #fff 100%);
  color: #3d0b0f;
  font-family: "Inter", "Segoe UI", system-ui, sans-serif;
}

.topbar {
  display: flex;
  justify-content: space-between;
  align-items: center;
  gap: 24px;
  margin-bottom: 32px;
}

.brand {
  display: flex;
  align-items: center;
  gap: 14px;
}

.logo {
  width: 52px;
  height: 52px;
  border-radius: 16px;
  display: grid;
  place-items: center;
  font-weight: 700;
  color: #fff7f1;
  background: linear-gradient(135deg, #5a0006, #d92200);
  box-shadow: 0 14px 30px rgba(90, 0, 6, 0.28);
}

.brand h1 {
  margin: 0;
  font-size: 24px;
}

.brand p {
  margin: 4px 0 0;
  color: #7a3b3b;
  font-size: 14px;
}

.nav-links {
  display: flex;
  gap: 12px;
  flex-wrap: wrap;
}

.nav-links a {
  text-decoration: none;
  color: #5a0006;
  background: #fff2ea;
  padding: 10px 16px;
  border-radius: 999px;
  font-size: 13px;
  font-weight: 600;
  box-shadow: 0 8px 18px rgba(90, 0, 6, 0.12);
}

.nav-links a.primary-link {
  background: #5a0006;
  color: #fff7f1;
}

.hero {
  display: grid;
  grid-template-columns: minmax(280px, 1.5fr) minmax(240px, 1fr);
  gap: 28px;
  align-items: stretch;
  margin-bottom: 32px;
}

.hero-text {
  background: #fff;
  border-radius: 28px;
  padding: 30px 32px;
  box-shadow: 0 18px 40px rgba(90, 0, 6, 0.12);
}

.eyebrow {
  text-transform: uppercase;
  letter-spacing: 0.18em;
  font-size: 11px;
  color: #920004;
  font-weight: 700;
}

.hero-text h2 {
  margin: 10px 0 12px;
  font-size: 30px;
}

.subtext {
  margin: 0 0 18px;
  color: #6b2f2f;
  line-height: 1.6;
}

.hero-actions {
  display: flex;
  gap: 12px;
  flex-wrap: wrap;
}

.cta-primary,
.cta-secondary,
.hero-cta,
.card-btn {
  border: none;
  padding: 10px 18px;
  border-radius: 999px;
  font-weight: 600;
  cursor: pointer;
}

.cta-primary {
  background: linear-gradient(135deg, #920004, #f3500a);
  color: #fff7f1;
  box-shadow: 0 14px 30px rgba(146, 0, 4, 0.25);
}

.cta-secondary {
  background: #fff2ea;
  color: #920004;
}

.hero-card {
  background: linear-gradient(165deg, #5a0006, #d92200 55%, #f37100);
  color: #fff7f1;
  padding: 26px;
  border-radius: 28px;
  display: grid;
  gap: 12px;
  box-shadow: 0 18px 40px rgba(90, 0, 6, 0.2);
}

.hero-badge {
  align-self: start;
  background: rgba(255, 255, 255, 0.2);
  padding: 6px 12px;
  border-radius: 999px;
  font-size: 12px;
  font-weight: 600;
}

.hero-meta {
  display: flex;
  justify-content: space-between;
  font-size: 13px;
  opacity: 0.9;
}

.hero-cta {
  background: #fff7f1;
  color: #5a0006;
}

.category-section {
  background: #fff;
  padding: 28px;
  border-radius: 28px;
  box-shadow: 0 18px 40px rgba(90, 0, 6, 0.12);
  margin-bottom: 32px;
}

.section-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  gap: 16px;
  margin-bottom: 20px;
}

.section-header h3 {
  margin: 0;
  font-size: 22px;
}

.section-header p {
  margin: 0;
  color: #6b2f2f;
}

.category-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
  gap: 18px;
}

.category-card {
  background: #fff6ef;
  border-radius: 22px;
  padding: 20px;
  display: grid;
  gap: 10px;
  box-shadow: inset 0 0 0 1px rgba(146, 0, 4, 0.08);
  text-decoration: none;
  color: inherit;
  transition: transform 0.2s ease, box-shadow 0.2s ease;
}

.category-card:hover {
  transform: translateY(-4px);
  box-shadow: 0 18px 32px rgba(90, 0, 6, 0.12);
}

.category-tag {
  font-size: 12px;
  font-weight: 700;
  color: #920004;
  letter-spacing: 0.12em;
}

.category-card h4 {
  margin: 0;
  font-size: 18px;
}

.category-card p {
  margin: 0;
  color: #6b2f2f;
  font-size: 14px;
}

.card-btn {
  background: #f37100;
  color: #fff7f1;
  justify-self: start;
  padding: 10px 18px;
  border-radius: 999px;
  font-weight: 600;
  display: inline-block;
}

@media (max-width: 960px) {
  .hero {
    grid-template-columns: 1fr;
  }

  .topbar {
    flex-direction: column;
    align-items: flex-start;
  }
}
</style>
