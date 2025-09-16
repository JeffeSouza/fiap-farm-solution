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
  - 💾 **Exportar dados para CSV** (integração com R)
  - 🚪 Sair do programa
- **Armazenamento em vetores** (listas Python)
- **Loops e estruturas de decisão**

### 📈 Aplicação R (`r/farmtech_stats.R`)
- **Importa dados reais** exportados do Python via CSV
- **Estatísticas descritivas**: média, desvio padrão, mediana
- **Análise comparativa** entre culturas (teste t)
- **Correlações** entre variáveis geométricas
- **Análise de eficiência** geométrica
- **Resumo executivo** com indicadores e recomendações

### 🌤️ Integração Meteorológica (`r/weather_api.R`)
- **Conecta à API wttr.in** (dados climáticos reais)
- **Coleta dados atuais**: temperatura, umidade, pressão
- **Análise de condições agrícolas** baseada em dados reais
- **Recomendações para atividades** (plantio, colheita, aplicações)
- **Sistema de backup** com dados simulados se API falhar

## 🚀 Como Executar

### Python
```bash
cd farmtech-solutions/python
python3 farmtech_app.py
```

### R - Análise Estatística (dados reais do Python)
```bash
cd farmtech-solutions/r
Rscript farmtech_stats.R
```

### R - Dados Meteorológicos (API real)
```bash
cd farmtech-solutions/r
Rscript weather_api.R
```

## 📊 Estrutura do Projeto

```
farmtech-solutions/
├── python/
│   ├── farmtech_app.py          # 🐍 Aplicação principal completa
│   └── gerar_dados_exemplo.py   # 🧪 Gerador de dados teste
├── r/
│   ├── farmtech_stats.R         # 📊 Análise estatística (dados reais)
│   └── weather_api.R            # 🌤️ API meteorológica (dados reais)
├── data/                        # 📁 Arquivos CSV (auto-criado)
├── docs/
│   └── resumo_artigo.md         # 📄 Resumo artigo Embrapa
├── README.md                    # 📖 Este arquivo
└── COMO_USAR.md                # 🚀 Instruções detalhadas
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

## 🌡️ Dados Meteorológicos (API Real)

- **Temperatura real**: análise de condições atuais (ex: 24°C)
- **Umidade atual**: avaliação de risco de doenças (ex: 61%)
- **Pressão atmosférica**: dados em tempo real (ex: 1019 hPa)
- **Condições climáticas**: status atual (ex: "Sunny")
- **Fonte**: API wttr.in (gratuita, sem chave necessária)

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