# 🌱 FarmTech Solutions - Como Usar

## 📋 Visão Geral

Este projeto integra **Python** e **R** para criar um sistema completo de agricultura digital. Os dados coletados no Python são automaticamente exportados para CSV e analisados estatisticamente no R.

## 🚀 Fluxo de Trabalho

### 1️⃣ Coleta de Dados (Python)

Execute a aplicação Python principal:

```bash
cd python
python3 farmtech_app.py
```

**Funcionalidades disponíveis:**
- ✅ Adicionar áreas de plantio (soja retangular, milho circular)
- ✅ Calcular insumos necessários
- ✅ Gerenciar dados (CRUD completo)
- ✅ **Exportar dados para CSV** (Opção 5)

### 2️⃣ Análise Estatística (R)

Após exportar dados do Python, execute:

```bash
cd r
Rscript farmtech_stats.R
```

**Análises realizadas:**
- 📊 Estatísticas descritivas (média, desvio, mediana)
- 📈 Comparação entre culturas
- ⚖️ Testes estatísticos (teste t)
- ⚡ Análise de eficiência geométrica
- 📋 Relatório consolidado

### 3️⃣ Dados Meteorológicos (Extra)

Para informações climáticas **REAIS via API**:

```bash
cd r
Rscript weather_api.R
```

## 📁 Estrutura de Arquivos

```
farmtech-solutions/
├── python/
│   ├── farmtech_app.py             # 🐍 Aplicação principal completa
│   └── gerar_dados_exemplo.py      # 🧪 Gerador de dados teste
├── r/
│   ├── farmtech_stats.R            # 📊 Análise estatística de dados reais
│   └── weather_api.R               # 🌤️ API meteorológica com dados reais
├── data/                           # 📁 Arquivos CSV (auto-criado)
│   ├── dados_consolidados_*.csv    # 🔗 Dados consolidados Python→R
│   ├── areas_soja_*.csv           # 🌿 Dados específicos soja
│   ├── areas_milho_*.csv          # 🌽 Dados específicos milho
│   └── analise_r_*.csv            # 📊 Resultados análise R
└── docs/
    └── resumo_artigo.md           # 📄 Resumo artigo Embrapa
```

## 🔄 Fluxo Integrado Completo

### Passo a Passo:

1. **Execute o Python** e adicione dados reais:
   ```bash
   cd python
   python3 farmtech_app.py
   ```

2. **Adicione algumas áreas** (use opção 1):
   - Soja: largura × comprimento
   - Milho: raio circular

3. **Exporte os dados** (use opção 5):
   - Cria arquivos CSV em `../data/`
   - Gera arquivo consolidado para R

4. **Execute análise R**:
   ```bash
   cd ../r
   Rscript farmtech_stats.R
   ```

5. **Veja os resultados**:
   - Estatísticas no terminal
   - Arquivo CSV com resultados em `../data/`

## 📊 Exemplo de Uso Rápido

Para testar rapidamente, use o gerador de dados:

```bash
# 1. Gerar dados de exemplo
cd python
python3 gerar_dados_exemplo.py

# 2. Analisar no R
cd ../r
Rscript farmtech_stats.R
```

## 🌤️ Dados Meteorológicos

Execute separadamente para informações climáticas:

```bash
cd r
Rscript weather_api.R
```

**Fornece (com dados REAIS da API):**
- 🌡️ **Temperatura e umidade reais** (ex: 24°C, 61%)
- 📊 **Pressão atmosférica atual** (ex: 1019 hPa)
- ☁️ **Condições climáticas atuais** (ex: "Sunny")
- 💡 **Recomendações agrícolas** baseadas no clima real
- 📡 **Conecta à API wttr.in** (gratuita, sem chave necessária)

## 📈 Tipos de Análises R

### Estatísticas Básicas
- Média, mediana, desvio padrão
- Coeficiente de variação
- Valores mínimo e máximo

### Análises Comparativas
- Comparação soja vs milho
- Teste t para diferença de médias
- Distribuição por cultura

### Análises de Eficiência
- Eficiência geométrica (área/perímetro)
- Correlações entre variáveis
- Recomendações de otimização

## 🛠️ Requisitos

### Python
- Python 3.x
- Módulos: `math`, `csv`, `os`, `datetime`

### R
- R 4.x
- Acesso a arquivos CSV
- Pacotes base do R
- **curl** (para API meteorológica)

## ✨ Funcionalidades Destacadas

### 🔗 **Integração Python ↔ R**
- Dados fluem automaticamente via CSV
- Análises estatísticas de dados reais
- Sistema robusto de importação

### 🌐 **API Meteorológica Real**
- Dados climáticos atualizados
- Recomendações agrícolas inteligentes
- Sistema de backup se API falhar

### 📊 **Análises Avançadas**
- Testes estatísticos (teste t)
- Correlações entre variáveis
- Eficiência geométrica das culturas

## 🚀 Próximos Passos

1. ✅ Adicione mais dados reais na aplicação Python
2. ✅ Use as opções de atualização e deleção
3. ✅ Execute análises R regularmente
4. ✅ Compare resultados ao longo do tempo
5. ✅ Use dados meteorológicos para decisões de plantio/colheita

---

*🌱 FarmTech Solutions - Transformando agricultura através da tecnologia digital com dados reais*