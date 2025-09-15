#!/usr/bin/env Rscript

# FarmTech Solutions - Análise Estatística
# Análise de dados de culturas: Soja e Milho

# Função para calcular estatísticas básicas
calcular_estatisticas <- function(dados, nome_variavel) {
  if (length(dados) == 0) {
    cat("Nenhum dado disponível para", nome_variavel, "\n")
    return()
  }
  
  media <- mean(dados)
  desvio <- sd(dados)
  mediana <- median(dados)
  minimo <- min(dados)
  maximo <- max(dados)
  
  cat("\n=== ESTATÍSTICAS:", nome_variavel, "===\n")
  cat("Número de observações:", length(dados), "\n")
  cat("Média:", round(media, 2), "\n")
  cat("Desvio Padrão:", round(desvio, 2), "\n")
  cat("Mediana:", round(mediana, 2), "\n")
  cat("Mínimo:", round(minimo, 2), "\n")
  cat("Máximo:", round(maximo, 2), "\n")
  cat("Coeficiente de Variação:", round((desvio/media)*100, 2), "%\n")
  cat("==========================================\n")
  
  return(list(
    media = media,
    desvio = desvio,
    mediana = mediana,
    minimo = minimo,
    maximo = maximo,
    cv = (desvio/media)*100
  ))
}

# Função para gerar dados de exemplo
gerar_dados_exemplo <- function() {
  cat("🌱 Gerando dados de exemplo para demonstração...\n")
  
  # Dados de áreas de soja (m²) - exemplo de 10 fazendas
  areas_soja <- c(15000, 22000, 18500, 25000, 20000, 17500, 23000, 19000, 21500, 16000)
  
  # Dados de áreas de milho (m²) - exemplo de 8 fazendas
  areas_milho <- c(12000, 16500, 14000, 18000, 13500, 15000, 17000, 14500)
  
  # Dados de produtividade soja (kg/hectare)
  prod_soja <- c(3200, 3500, 3100, 3800, 3400, 3300, 3600, 3250, 3450, 3150)
  
  # Dados de produtividade milho (kg/hectare)
  prod_milho <- c(8500, 9200, 8800, 9500, 8700, 9000, 9300, 8600)
  
  # Dados de custos de insumos soja (R$/hectare)
  custos_soja <- c(1800, 2100, 1950, 2200, 2000, 1900, 2150, 1850, 2050, 1750)
  
  # Dados de custos de insumos milho (R$/hectare)
  custos_milho <- c(2200, 2500, 2350, 2600, 2300, 2400, 2550, 2250)
  
  return(list(
    areas_soja = areas_soja,
    areas_milho = areas_milho,
    prod_soja = prod_soja,
    prod_milho = prod_milho,
    custos_soja = custos_soja,
    custos_milho = custos_milho
  ))
}

# Função para análise comparativa
analise_comparativa <- function(dados) {
  cat("\n🔍 ANÁLISE COMPARATIVA SOJA vs MILHO\n")
  cat("=====================================\n")
  
  # Comparação de áreas
  cat("\n📊 ÁREAS DE PLANTIO:\n")
  area_total_soja <- sum(dados$areas_soja)
  area_total_milho <- sum(dados$areas_milho)
  cat("Área total soja:", area_total_soja, "m²\n")
  cat("Área total milho:", area_total_milho, "m²\n")
  cat("Percentual soja:", round((area_total_soja/(area_total_soja + area_total_milho))*100, 1), "%\n")
  cat("Percentual milho:", round((area_total_milho/(area_total_soja + area_total_milho))*100, 1), "%\n")
  
  # Comparação de produtividade
  cat("\n📈 PRODUTIVIDADE:\n")
  prod_media_soja <- mean(dados$prod_soja)
  prod_media_milho <- mean(dados$prod_milho)
  cat("Produtividade média soja:", round(prod_media_soja, 0), "kg/ha\n")
  cat("Produtividade média milho:", round(prod_media_milho, 0), "kg/ha\n")
  
  if (prod_media_milho > prod_media_soja) {
    cat("🏆 Milho tem maior produtividade por hectare\n")
  } else {
    cat("🏆 Soja tem maior produtividade por hectare\n")
  }
  
  # Comparação de custos
  cat("\n💰 CUSTOS DE INSUMOS:\n")
  custo_medio_soja <- mean(dados$custos_soja)
  custo_medio_milho <- mean(dados$custos_milho)
  cat("Custo médio soja:", round(custo_medio_soja, 0), "R$/ha\n")
  cat("Custo médio milho:", round(custo_medio_milho, 0), "R$/ha\n")
  
  if (custo_medio_soja < custo_medio_milho) {
    cat("💡 Soja tem menor custo de insumos por hectare\n")
  } else {
    cat("💡 Milho tem menor custo de insumos por hectare\n")
  }
}

# Função para análise de correlação
analise_correlacao <- function(dados) {
  cat("\n🔗 ANÁLISE DE CORRELAÇÃO\n")
  cat("========================\n")
  
  # Correlação entre área e produtividade na soja
  if (length(dados$areas_soja) == length(dados$prod_soja)) {
    cor_soja <- cor(dados$areas_soja, dados$prod_soja)
    cat("Correlação área vs produtividade (Soja):", round(cor_soja, 3), "\n")
    
    if (abs(cor_soja) > 0.7) {
      cat("→ Correlação forte\n")
    } else if (abs(cor_soja) > 0.3) {
      cat("→ Correlação moderada\n")
    } else {
      cat("→ Correlação fraca\n")
    }
  }
  
  # Correlação entre área e produtividade no milho
  if (length(dados$areas_milho) == length(dados$prod_milho)) {
    cor_milho <- cor(dados$areas_milho, dados$prod_milho)
    cat("Correlação área vs produtividade (Milho):", round(cor_milho, 3), "\n")
    
    if (abs(cor_milho) > 0.7) {
      cat("→ Correlação forte\n")
    } else if (abs(cor_milho) > 0.3) {
      cat("→ Correlação moderada\n")
    } else {
      cat("→ Correlação fraca\n")
    }
  }
}

# Função principal
main <- function() {
  cat("🌾 FARMTECH SOLUTIONS - ANÁLISE ESTATÍSTICA 🌾\n")
  cat("================================================\n")
  
  # Gerar ou carregar dados
  dados <- gerar_dados_exemplo()
  
  # Calcular estatísticas para cada variável
  cat("\n📊 CALCULANDO ESTATÍSTICAS DESCRITIVAS...\n")
  
  # Estatísticas das áreas
  stats_area_soja <- calcular_estatisticas(dados$areas_soja, "ÁREAS DE SOJA (m²)")
  stats_area_milho <- calcular_estatisticas(dados$areas_milho, "ÁREAS DE MILHO (m²)")
  
  # Estatísticas de produtividade
  stats_prod_soja <- calcular_estatisticas(dados$prod_soja, "PRODUTIVIDADE SOJA (kg/ha)")
  stats_prod_milho <- calcular_estatisticas(dados$prod_milho, "PRODUTIVIDADE MILHO (kg/ha)")
  
  # Estatísticas de custos
  stats_custo_soja <- calcular_estatisticas(dados$custos_soja, "CUSTOS SOJA (R$/ha)")
  stats_custo_milho <- calcular_estatisticas(dados$custos_milho, "CUSTOS MILHO (R$/ha)")
  
  # Análises adicionais
  analise_comparativa(dados)
  analise_correlacao(dados)
  
  # Resumo executivo
  cat("\n📋 RESUMO EXECUTIVO\n")
  cat("===================\n")
  cat("• Total de fazendas analisadas (soja):", length(dados$areas_soja), "\n")
  cat("• Total de fazendas analisadas (milho):", length(dados$areas_milho), "\n")
  cat("• Área média por fazenda (soja):", round(mean(dados$areas_soja), 0), "m²\n")
  cat("• Área média por fazenda (milho):", round(mean(dados$areas_milho), 0), "m²\n")
  cat("• Produtividade total estimada (soja):", 
      round(sum(dados$areas_soja) * mean(dados$prod_soja) / 10000, 0), "kg\n")
  cat("• Produtividade total estimada (milho):", 
      round(sum(dados$areas_milho) * mean(dados$prod_milho) / 10000, 0), "kg\n")
  
  cat("\n✅ Análise concluída com sucesso!\n")
  cat("📊 Dados exportados para integração com sistema Python\n")
}

# Executar análise
if (!interactive()) {
  main()
}