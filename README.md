# 🌱 FarmTech Solutions - Agricultura Digital

## 📋 Descrição do Projeto

Sistema desenvolvido pela startup **FarmTech Solutions** para auxiliar fazendas na migração para a **Agricultura Digital**. O projeto combina aplicações em Python e R para gerenciamento de culturas, cálculos agrícolas e análise estatística.

## 🎯 Funcionalidades

### 🐍 Aplicação Python (`python/farmtech_app.py`)
- **Suporte a 2 culturas**: Soja (área retangular) e Milho (área circular)
- **Cálculo de área de plantio** com diferentes geometrias
- **Manejo de insumos**: 
  - Soja: aplicação por metro linear (ex: fosfato 500ml/metro)
  - Milho: aplicação por hectare (ex: fertilizante kg/ha)
- **Sistema de menu interativo** com opções:
  - ✅ Entrada de dados
  - 📊 Saída de dados  
  - 🔄 Atualização de dados
  - 🗑️ Deleção de dados
  - 🚪 Sair do programa
- **Armazenamento em vetores** (listas Python)
- **Loops e estruturas de decisão**

### 📈 Aplicação R (`r/farmtech_stats.R`)
- **Estatísticas descritivas**: média, desvio padrão, mediana
- **Análise comparativa** entre culturas
- **Correlações** entre variáveis
- **Resumo executivo** com indicadores

### 🌤️ Integração Meteorológica (`r/weather_api.R`)
- **Coleta de dados climáticos** via API
- **Análise de condições agrícolas**
- **Recomendações para atividades** (plantio, colheita, aplicações)
- **Histórico climatológico**

## 🚀 Como Executar

### Python
```bash
cd farmtech-solutions/python
python3 farmtech_app.py
```

### R - Estatísticas
```bash
cd farmtech-solutions/r
Rscript farmtech_stats.R
```

### R - Dados Meteorológicos
```bash
cd farmtech-solutions/r
Rscript weather_api.R
```

## 📊 Estrutura do Projeto

```
farmtech-solutions/
├── python/
│   └── farmtech_app.py      # Aplicação principal Python
├── r/
│   ├── farmtech_stats.R     # Análise estatística
│   └── weather_api.R        # Integração meteorológica
├── docs/
│   └── resumo_artigo.md     # Resumo do artigo Embrapa
└── README.md                # Este arquivo
```

## 🌾 Culturas Suportadas

### 🌿 Soja
- **Geometria**: Área retangular (largura × comprimento)
- **Insumos**: Aplicação por metro linear
- **Exemplo**: Fosfato 500ml/metro, calculado por número de ruas

### 🌽 Milho  
- **Geometria**: Área circular (π × raio²)
- **Insumos**: Aplicação por hectare
- **Exemplo**: Fertilizante 250kg/hectare

## 📈 Análises Estatísticas

- **Medidas de tendência central**: média, mediana
- **Medidas de dispersão**: desvio padrão, coeficiente de variação
- **Comparações**: soja vs milho em produtividade e custos
- **Correlações**: relação entre área e produtividade

## 🌡️ Dados Meteorológicos

- **Temperatura**: análise de condições ideais para crescimento
- **Umidade**: avaliação de risco de doenças
- **Vento**: recomendações para aplicação de defensivos
- **Precipitação**: orientações para plantio e colheita

## 👥 Equipe

**Curso**: Graduação em Inteligência Artificial - FIAP  
**Startup**: FarmTech Solutions  
**Projeto**: Migração para Agricultura Digital

## 📚 Referências

- Artigo Embrapa sobre Agricultura Digital
- APIs meteorológicas públicas
- Boas práticas em desenvolvimento colaborativo com Git

## 🤖 Uso de IA

Este projeto foi desenvolvido com apoio de Inteligência Artificial, seguindo as diretrizes da FIAP para uso crítico e responsável de IA nos estudos.

---

*🌱 Transformando a agricultura através da tecnologia digital*