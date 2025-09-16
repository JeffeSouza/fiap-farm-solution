#!/usr/bin/env python3
"""
Script para gerar dados de exemplo e testar o fluxo Python -> CSV -> R
"""

from farmtech_app import CulturaData

def gerar_dados_exemplo():
    print("🌱 Gerando dados de exemplo para teste...")
    
    cultura_data = CulturaData()
    
    # Adicionar algumas áreas de soja
    print("Adicionando áreas de soja...")
    cultura_data.adicionar_area_soja(100, 200)  # 20.000 m²
    cultura_data.adicionar_area_soja(150, 180)  # 27.000 m²
    cultura_data.adicionar_area_soja(120, 250)  # 30.000 m²
    
    # Adicionar algumas áreas de milho
    print("Adicionando áreas de milho...")
    cultura_data.adicionar_area_milho(50)   # ~7.854 m²
    cultura_data.adicionar_area_milho(75)   # ~17.671 m²
    cultura_data.adicionar_area_milho(60)   # ~11.310 m²
    
    # Adicionar alguns insumos
    print("Adicionando insumos...")
    cultura_data.adicionar_insumo_soja("Fosfato", 500, 20, 100)
    cultura_data.adicionar_insumo_soja("Herbicida", 300, 15, 150)
    
    cultura_data.adicionar_insumo_milho("Fertilizante NPK", 250, 2.5)
    cultura_data.adicionar_insumo_milho("Ureia", 150, 1.8)
    
    # Exportar dados
    print("Exportando dados para CSV...")
    timestamp = cultura_data.exportar_dados_csv()
    
    print(f"✅ Dados de exemplo criados e exportados!")
    print(f"📁 Timestamp: {timestamp}")
    print(f"📊 Total de registros:")
    print(f"   • Áreas de soja: {len(cultura_data.areas_soja)}")
    print(f"   • Áreas de milho: {len(cultura_data.areas_milho)}")
    print(f"   • Insumos de soja: {len(cultura_data.insumos_soja)}")
    print(f"   • Insumos de milho: {len(cultura_data.insumos_milho)}")
    
    return timestamp

if __name__ == "__main__":
    gerar_dados_exemplo()