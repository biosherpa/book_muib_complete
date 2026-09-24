name: Compilar y Publicar Libro y Diapositivas

on:
  push:
    branches: [ main, master ]

# Permisos explícitos necesarios para publicar en gh-pages
permissions:
  contents: write
  pages: write
  id-token: write

jobs:
  build-deploy:
    runs-on: ubuntu-latest
    steps:
      # 1. Copiar el repositorio
      - name: Checkout repo
        uses: actions/checkout@v4

      # 2. Instalar dependencias del sistema para paquetes gráficos de R
      - name: Install system dependencies
        run: |
          sudo apt-get update
          sudo apt-get install -y libcurl4-openssl-dev libssl-dev libxml2-dev libfontconfig1-dev libharfbuzz-dev libfribidi-dev libfreetype6-dev libpng-dev libtiff5-dev libjpeg-dev

      # 3. Configurar R
      - name: Set up R
        uses: r-lib/actions/setup-r@v2
        with:
          r-version: 'release'

      # 4. Instalar librerías de R con soporte de binarios (pak)
      - name: Install R Dependencies
        run: |
          install.packages("pak", repos = "https://r-lib.github.io/p/pak/stable/")
          pak::pkg_install(c("survival", "survminer", "pROC", "ggplot2"))
        shell: Rscript {0}

      # 5. Configurar Quarto CLI
      - name: Set up Quarto
        uses: quarto-dev/quarto-actions/setup@v2

      # 6. Renderizar el libro y las diapositivas
      - name: Render Quarto Project
        run: quarto render

      # 7. Publicar en la rama gh-pages
      - name: Publish to GitHub Pages
        uses: quarto-dev/quarto-actions/publish@v2
        with:
          target: gh-pages
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}