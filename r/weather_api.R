#!/usr/bin/env Rscript

# FarmTech Solutions - Integração com API Meteorológica
# Coleta dados climáticos para apoio à agricultura digital

# Verificar e instalar pacotes necessários
packages_needed <- c("httr", "jsonlite")

for (pkg in packages_needed) {
  if (!require(pkg, character.only = TRUE)) {
    cat("Instalando pacote:", pkg, "\n")
    install.packages(pkg, repos = "https://cran.r-project.org/")
    library(pkg, character.only = TRUE)
  }
}

# Função para obter dados meteorológicos (usando OpenWeatherMap API gratuita)
obter_dados_clima <- function(cidade = "São Paulo", api_key = "demo") {
  cat("🌤️ Coletando dados meteorológicos para", cidade, "...\n")
  
  # URL da API (usando dados de exemplo se não há API key válida)
  if (api_key == "demo") {
    cat("⚠️ Usando dados de exemplo (API key demo)\n")
    return(gerar_dados_clima_exemplo(cidade))
  }
  
  base_url <- "http://api.openweathermap.org/data/2.5/weather"
  url <- paste0(base_url, "?q=", cidade, "&appid=", api_key, "&units=metric&lang=pt")
  
  tryCatch({
    response <- GET(url)
    
    if (status_code(response) == 200) {
      data <- fromJSON(content(response, "text"))
      return(processar_dados_clima(data))
    } else {
      cat("❌ Erro na API. Usando dados de exemplo.\n")
      return(gerar_dados_clima_exemplo(cidade))
    }
  }, error = function(e) {
    cat("❌ Erro de conexão. Usando dados de exemplo.\n")
    return(gerar_dados_clima_exemplo(cidade))
  })
}

# Função para gerar dados climáticos de exemplo
gerar_dados_clima_exemplo <- function(cidade) {
  # Simular dados realistas para agricultura
  set.seed(as.numeric(Sys.Date()))
  
  temp_atual <- round(runif(1, 18, 32), 1)
  umidade <- round(runif(1, 45, 85), 0)
  pressao <- round(runif(1, 1010, 1025), 1)
  vento_vel <- round(runif(1, 5, 25), 1)
  
  condicoes <- c("Ensolarado", "Parcialmente nublado", "Nublado", "Chuvoso")
  condicao <- sample(condicoes, 1)
  
  return(list(
    cidade = cidade,
    temperatura = temp_atual,
    umidade = umidade,
    pressao = pressao,
    vento_velocidade = vento_vel,
    condicao = condicao,
    timestamp = Sys.time()
  ))
}

# Função para processar dados reais da API
processar_dados_clima <- function(data) {
  return(list(
    cidade = data$name,
    temperatura = round(data$main$temp, 1),
    umidade = data$main$humidity,
    pressao = data$main$pressure,
    vento_velocidade = round(data$wind$speed * 3.6, 1), # m/s para km/h
    condicao = data$weather[[1]]$description,
    timestamp = Sys.time()
  ))
}

# Função para análise climática para agricultura
analisar_condicoes_agricolas <- function(dados_clima) {
  cat("\n🌱 ANÁLISE PARA AGRICULTURA\n")
  cat("===========================\n")
  
  temp <- dados_clima$temperatura
  umidade <- dados_clima$umidade
  vento <- dados_clima$vento_velocidade
  
  # Análise de temperatura
  cat("🌡️ TEMPERATURA:", temp, "°C\n")
  if (temp >= 20 && temp <= 30) {
    cat("✅ Temperatura ideal para soja e milho\n")
  } else if (temp < 15) {
    cat("⚠️ Temperatura baixa - pode afetar crescimento\n")
  } else if (temp > 35) {
    cat("⚠️ Temperatura alta - risco de estresse térmico\n")
  } else {
    cat("⚡ Temperatura aceitável com monitoramento\n")
  }
  
  # Análise de umidade
  cat("\n💧 UMIDADE:", umidade, "%\n")
  if (umidade >= 60 && umidade <= 80) {
    cat("✅ Umidade ideal para desenvolvimento das culturas\n")
  } else if (umidade < 50) {
    cat("⚠️ Umidade baixa - considerar irrigação\n")
  } else if (umidade > 85) {
    cat("⚠️ Umidade alta - risco de doenças fúngicas\n")
  } else {
    cat("⚡ Umidade moderada - monitorar plantas\n")
  }
  
  # Análise de vento
  cat("\n💨 VENTO:", vento, "km/h\n")
  if (vento <= 15) {
    cat("✅ Vento calmo - bom para aplicação de defensivos\n")
  } else if (vento <= 25) {
    cat("⚠️ Vento moderado - cuidado com aplicações\n")
  } else {
    cat("❌ Vento forte - evitar pulverizações\n")
  }
  
  # Recomendações gerais
  cat("\n📋 RECOMENDAÇÕES:\n")
  
  if (dados_clima$condicao %in% c("Chuvoso", "chuva")) {
    cat("🌧️ Condição chuvosa - ideal para plantio, evitar colheita\n")
  } else if (dados_clima$condicao %in% c("Ensolarado", "limpo")) {
    cat("☀️ Condição ensolarada - ideal para colheita e secagem\n")
  }
  
  if (temp >= 25 && umidade >= 70) {
    cat("🦠 Condições favoráveis para doenças - monitorar\n")
  }
  
  if (vento <= 10 && dados_clima$condicao != "Chuvoso") {
    cat("🚁 Condições boas para aplicação aérea\n")
  }
}

# Função para histórico climático simulado
gerar_historico_clima <- function(dias = 7) {
  cat("\n📅 HISTÓRICO CLIMÁTICO (", dias, "dias)\n")
  cat("=====================================\n")
  
  historico <- data.frame(
    dia = 1:dias,
    temp_max = round(runif(dias, 22, 35), 1),
    temp_min = round(runif(dias, 12, 22), 1),
    umidade = round(runif(dias, 45, 90), 0),
    chuva = round(runif(dias, 0, 15), 1)
  )
  
  for (i in 1:nrow(historico)) {
    cat("Dia", historico$dia[i], ":")
    cat(" Max:", historico$temp_max[i], "°C")
    cat(" Min:", historico$temp_min[i], "°C")
    cat(" Umidade:", historico$umidade[i], "%")
    cat(" Chuva:", historico$chuva[i], "mm\n")
  }
  
  # Estatísticas do período
  cat("\n📊 ESTATÍSTICAS DO PERÍODO:\n")
  cat("Temperatura máxima média:", round(mean(historico$temp_max), 1), "°C\n")
  cat("Temperatura mínima média:", round(mean(historico$temp_min), 1), "°C\n")
  cat("Umidade média:", round(mean(historico$umidade), 1), "%\n")
  cat("Precipitação total:", round(sum(historico$chuva), 1), "mm\n")
  
  return(historico)
}

# Função principal
main_weather <- function() {
  cat("🌦️ FARMTECH SOLUTIONS - DADOS METEOROLÓGICOS 🌦️\n")
  cat("=================================================\n")
  
  # Cidades importantes para agricultura no Brasil
  cidades <- c("São Paulo", "Cuiabá", "Goiânia", "Ribeirão Preto")
  
  cat("📍 Cidades monitoradas:\n")
  for (i in 1:length(cidades)) {
    cat(i, ".", cidades[i], "\n")
  }
  
  # Solicitar cidade ou usar padrão
  cat("\nDigite o número da cidade (ou Enter para São Paulo): ")
  if (interactive()) {
    escolha <- readline()
    if (escolha == "" || !escolha %in% 1:length(cidades)) {
      cidade_escolhida <- cidades[1]
    } else {
      cidade_escolhida <- cidades[as.numeric(escolha)]
    }
  } else {
    cidade_escolhida <- cidades[1]
  }
  
  # Obter dados climáticos atuais
  dados_clima <- obter_dados_clima(cidade_escolhida)
  
  # Exibir dados atuais
  cat("\n🌍 CONDIÇÕES ATUAIS -", dados_clima$cidade, "\n")
  cat("=====================================\n")
  cat("🌡️ Temperatura:", dados_clima$temperatura, "°C\n")
  cat("💧 Umidade:", dados_clima$umidade, "%\n")
  cat("📊 Pressão:", dados_clima$pressao, "hPa\n")
  cat("💨 Vento:", dados_clima$vento_velocidade, "km/h\n")
  cat("☁️ Condição:", dados_clima$condicao, "\n")
  cat("⏰ Atualizado:", format(dados_clima$timestamp, "%d/%m/%Y %H:%M"), "\n")
  
  # Análise para agricultura
  analisar_condicoes_agricolas(dados_clima)
  
  # Histórico simulado
  historico <- gerar_historico_clima(7)
  
  cat("\n✅ Dados meteorológicos coletados com sucesso!\n")
  cat("📱 Use essas informações para otimizar suas atividades agrícolas\n")
  
  return(list(atual = dados_clima, historico = historico))
}

# Executar se não estiver em modo interativo
if (!interactive()) {
  main_weather()
}