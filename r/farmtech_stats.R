#!/usr/bin/env Rscript

# FarmTech Solutions - Análise de Dados Reais do Python
# Importa dados CSV exportados pela aplicação Python e realiza análises estatísticas

# Função para carregar dados CSV mais recente
carregar_dados_python <- function() {
  cat("📂 Carregando dados exportados do Python...\n")
  
  # Verificar se diretório data existe
  if (!dir.exists("../data")) {
    cat("❌ Diretório ../data não encontrado!\n")
    cat("💡 Execute a aplicação Python e exporte alguns dados primeiro.\n")
    return(NULL)
  }
  
  # Buscar arquivo consolidado mais recente
  arquivos_csv <- list.files("../data", pattern = "dados_consolidados_.*\\.csv", full.names = TRUE)
  
  if (length(arquivos_csv) == 0) {
    cat("❌ Nenhum arquivo de dados consolidados encontrado!\n")
    cat("💡 Execute a aplicação Python e exporte dados primeiro.\n")
    return(NULL)
  }
  
  # Pegar arquivo mais recente
  arquivo_mais_recente <- arquivos_csv[which.max(file.mtime(arquivos_csv))]
  cat("📄 Carregando arquivo:", basename(arquivo_mais_recente), "\n")
  
  # Carregar dados
  tryCatch({
    dados <- read.csv(arquivo_mais_recente, stringsAsFactors = FALSE, encoding = "UTF-8")
    cat("✅ Dados carregados com sucesso!\n")
    cat("📊 Total de registros:", nrow(dados), "\n")
    return(dados)
  }, error = function(e) {
    cat("❌ Erro ao carregar dados:", e$message, "\n")
    return(NULL)
  })
}

# Função para análise exploratória dos dados
analise_exploratoria <- function(dados) {
  cat("\n🔍 ANÁLISE EXPLORATÓRIA DOS DADOS\n")
  cat("==================================\n")
  
  # Resumo básico
  cat("📋 RESUMO DOS DADOS:\n")
  cat("Total de registros:", nrow(dados), "\n")
  cat("Colunas:", ncol(dados), "\n")
  cat("Culturas únicas:", paste(unique(dados$cultura), collapse = ", "), "\n")
  
  # Distribuição por cultura
  cat("\n📊 DISTRIBUIÇÃO POR CULTURA:\n")
  tabela_cultura <- table(dados$cultura)
  for (i in 1:length(tabela_cultura)) {
    cultura <- names(tabela_cultura)[i]
    count <- tabela_cultura[i]
    percent <- round((count / nrow(dados)) * 100, 1)
    cat(sprintf("• %s: %d registros (%.1f%%)\n", cultura, count, percent))
  }
  
  # Estatísticas de área
  cat("\n📏 ESTATÍSTICAS DE ÁREA:\n")
  cat("Área mínima:", round(min(dados$area_m2), 2), "m²\n")
  cat("Área máxima:", round(max(dados$area_m2), 2), "m²\n")
  cat("Área média:", round(mean(dados$area_m2), 2), "m²\n")
  cat("Área mediana:", round(median(dados$area_m2), 2), "m²\n")
  cat("Desvio padrão:", round(sd(dados$area_m2), 2), "m²\n")
  
  return(dados)
}

# Função para análise estatística detalhada
analise_estatistica_detalhada <- function(dados) {
  cat("\n📈 ANÁLISE ESTATÍSTICA DETALHADA\n")
  cat("================================\n")
  
  # Separar dados por cultura
  dados_soja <- dados[dados$cultura == "soja", ]
  dados_milho <- dados[dados$cultura == "milho", ]
  
  # Análise da soja
  if (nrow(dados_soja) > 0) {
    cat("\n🌿 ESTATÍSTICAS DA SOJA:\n")
    cat("Registros:", nrow(dados_soja), "\n")
    cat("Área média:", round(mean(dados_soja$area_m2), 2), "m²\n")
    cat("Desvio padrão:", round(sd(dados_soja$area_m2), 2), "m²\n")
    cat("Coef. variação:", round((sd(dados_soja$area_m2)/mean(dados_soja$area_m2))*100, 2), "%\n")
    
    if (nrow(dados_soja) > 1) {
      # Análise de largura vs comprimento
      if (sum(dados_soja$largura != "") > 1) {
        larguras <- as.numeric(dados_soja$largura[dados_soja$largura != ""])
        comprimentos <- as.numeric(dados_soja$comprimento[dados_soja$comprimento != ""])
        
        if (length(larguras) == length(comprimentos) && length(larguras) > 1) {
          correlacao <- cor(larguras, comprimentos)
          cat("Correlação largura x comprimento:", round(correlacao, 3), "\n")
        }
      }
    }
  }
  
  # Análise do milho
  if (nrow(dados_milho) > 0) {
    cat("\n🌽 ESTATÍSTICAS DO MILHO:\n")
    cat("Registros:", nrow(dados_milho), "\n")
    cat("Área média:", round(mean(dados_milho$area_m2), 2), "m²\n")
    cat("Desvio padrão:", round(sd(dados_milho$area_m2), 2), "m²\n")
    cat("Coef. variação:", round((sd(dados_milho$area_m2)/mean(dados_milho$area_m2))*100, 2), "%\n")
    
    if (nrow(dados_milho) > 1) {
      # Análise de raios
      raios <- as.numeric(dados_milho$raio[dados_milho$raio != ""])
      if (length(raios) > 1) {
        cat("Raio médio:", round(mean(raios), 2), "m\n")
        cat("Raio mínimo:", round(min(raios), 2), "m\n")
        cat("Raio máximo:", round(max(raios), 2), "m\n")
      }
    }
  }
  
  # Comparação entre culturas
  if (nrow(dados_soja) > 0 && nrow(dados_milho) > 0) {
    cat("\n⚖️ COMPARAÇÃO ENTRE CULTURAS:\n")
    
    area_media_soja <- mean(dados_soja$area_m2)
    area_media_milho <- mean(dados_milho$area_m2)
    
    cat("Área média soja:", round(area_media_soja, 2), "m²\n")
    cat("Área média milho:", round(area_media_milho, 2), "m²\n")
    
    if (area_media_soja > area_media_milho) {
      diff_percent <- round(((area_media_soja - area_media_milho) / area_media_milho) * 100, 1)
      cat("🏆 Soja tem área média", diff_percent, "% maior que milho\n")
    } else {
      diff_percent <- round(((area_media_milho - area_media_soja) / area_media_soja) * 100, 1)
      cat("🏆 Milho tem área média", diff_percent, "% maior que soja\n")
    }
    
    # Teste t para diferença de médias (se temos dados suficientes)
    if (nrow(dados_soja) >= 3 && nrow(dados_milho) >= 3) {
      teste_t <- t.test(dados_soja$area_m2, dados_milho$area_m2)
      cat("P-valor do teste t:", round(teste_t$p.value, 4), "\n")
      
      if (teste_t$p.value < 0.05) {
        cat("📊 Diferença estatisticamente significativa (p < 0.05)\n")
      } else {
        cat("📊 Diferença não significativa estatisticamente (p >= 0.05)\n")
      }
    }
  }
}

# Função para análise de eficiência
analise_eficiencia <- function(dados) {
  cat("\n⚡ ANÁLISE DE EFICIÊNCIA\n")
  cat("========================\n")
  
  dados_soja <- dados[dados$cultura == "soja", ]
  dados_milho <- dados[dados$cultura == "milho", ]
  
  # Eficiência da soja (área por unidade de perímetro)
  if (nrow(dados_soja) > 0) {
    cat("\n🌿 EFICIÊNCIA GEOMÉTRICA DA SOJA:\n")
    
    for (i in 1:nrow(dados_soja)) {
      if (dados_soja$largura[i] != "" && dados_soja$comprimento[i] != "") {
        largura <- as.numeric(dados_soja$largura[i])
        comprimento <- as.numeric(dados_soja$comprimento[i])
        area <- dados_soja$area_m2[i]
        perimetro <- 2 * (largura + comprimento)
        eficiencia <- area / perimetro
        
        cat(sprintf("Plot %s: %.2f m²/m de perímetro\n", dados_soja$id[i], eficiencia))
      }
    }
  }
  
  # Eficiência do milho (relação área/raio)
  if (nrow(dados_milho) > 0) {
    cat("\n🌽 EFICIÊNCIA GEOMÉTRICA DO MILHO:\n")
    
    for (i in 1:nrow(dados_milho)) {
      if (dados_milho$raio[i] != "") {
        raio <- as.numeric(dados_milho$raio[i])
        area <- dados_milho$area_m2[i]
        eficiencia <- area / raio
        
        cat(sprintf("Plot %s: %.2f m²/m de raio\n", dados_milho$id[i], eficiencia))
      }
    }
  }
}

# Função para gerar relatório consolidado
gerar_relatorio_consolidado <- function(dados) {
  cat("\n📋 RELATÓRIO CONSOLIDADO\n")
  cat("========================\n")
  
  total_area <- sum(dados$area_m2)
  total_area_ha <- total_area / 10000
  
  cat("📊 RESUMO EXECUTIVO:\n")
  cat("• Total de propriedades analisadas:", nrow(dados), "\n")
  cat("• Área total:", round(total_area, 2), "m² (", round(total_area_ha, 2), "hectares)\n")
  cat("• Área média por propriedade:", round(mean(dados$area_m2), 2), "m²\n")
  
  if (length(unique(dados$cultura)) > 1) {
    cat("\n🌾 DISTRIBUIÇÃO POR CULTURA:\n")
    for (cultura in unique(dados$cultura)) {
      dados_cultura <- dados[dados$cultura == cultura, ]
      area_cultura <- sum(dados_cultura$area_m2)
      percent_cultura <- round((area_cultura / total_area) * 100, 1)
      
      cat(sprintf("• %s: %.2f m² (%.1f%% do total)\n", 
                  tools::toTitleCase(cultura), area_cultura, percent_cultura))
    }
  }
  
  cat("\n💡 RECOMENDAÇÕES:\n")
  
  # Recomendação baseada na variabilidade
  cv_total <- (sd(dados$area_m2) / mean(dados$area_m2)) * 100
  if (cv_total > 50) {
    cat("• Alta variabilidade nas áreas - considerar padronização\n")
  } else if (cv_total < 20) {
    cat("• Boa uniformidade nas áreas de plantio\n")
  }
  
  # Recomendação baseada no número de culturas
  if (length(unique(dados$cultura)) == 1) {
    cat("• Considerar diversificação de culturas para reduzir riscos\n")
  } else {
    cat("• Boa diversificação de culturas implementada\n")
  }
  
  cat("\n✅ Análise concluída com dados reais da aplicação Python!\n")
}

# Função principal
main_real_data <- function() {
  cat("🌾 FARMTECH SOLUTIONS - ANÁLISE DE DADOS REAIS 🌾\n")
  cat("==================================================\n")
  
  # Carregar dados do Python
  dados <- carregar_dados_python()
  
  if (is.null(dados)) {
    cat("\n💡 Para usar esta análise:\n")
    cat("1. Execute a aplicação Python: python3 farmtech_app_updated.py\n")
    cat("2. Adicione alguns dados de áreas\n")
    cat("3. Use a opção '5. Exportar dados para CSV'\n")
    cat("4. Execute novamente esta análise R\n")
    return()
  }
  
  # Realizar análises
  dados <- analise_exploratoria(dados)
  analise_estatistica_detalhada(dados)
  analise_eficiencia(dados)
  gerar_relatorio_consolidado(dados)
  
  # Salvar resultados
  timestamp <- format(Sys.time(), "%Y%m%d_%H%M%S")
  
  # Criar summary dos dados para exportar
  if (nrow(dados) > 0) {
    summary_dados <- data.frame(
      cultura = dados$cultura,
      area_m2 = dados$area_m2,
      area_hectares = dados$area_m2 / 10000,
      timestamp_analise = timestamp
    )
    
    # Salvar summary
    write.csv(summary_dados, paste0("../data/analise_r_", timestamp, ".csv"), 
              row.names = FALSE, fileEncoding = "UTF-8")
    
    cat("\n💾 Análise salva em: analise_r_", timestamp, ".csv\n")
  }
  
  return(dados)
}

# Executar se não estiver em modo interativo
if (!interactive()) {
  main_real_data()
}