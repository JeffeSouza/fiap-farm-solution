#!/usr/bin/env python3
"""
FarmTech Solutions - Agricultura Digital
Sistema de gerenciamento de culturas para fazendas
Culturas suportadas: Soja e Milho
"""

import math
import sys

class CulturaData:
    def __init__(self):
        self.areas_soja = []
        self.areas_milho = []
        self.insumos_soja = []
        self.insumos_milho = []
    
    def adicionar_area_soja(self, largura, comprimento):
        area = largura * comprimento
        self.areas_soja.append({"largura": largura, "comprimento": comprimento, "area": area})
        return area
    
    def adicionar_area_milho(self, raio):
        area = math.pi * raio ** 2
        self.areas_milho.append({"raio": raio, "area": area})
        return area
    
    def adicionar_insumo_soja(self, produto, ml_por_metro, num_ruas, metros_por_rua):
        total_metros = num_ruas * metros_por_rua
        litros_necessarios = (ml_por_metro * total_metros) / 1000
        insumo = {
            "produto": produto,
            "ml_por_metro": ml_por_metro,
            "num_ruas": num_ruas,
            "metros_por_rua": metros_por_rua,
            "total_metros": total_metros,
            "litros_necessarios": litros_necessarios
        }
        self.insumos_soja.append(insumo)
        return litros_necessarios
    
    def adicionar_insumo_milho(self, produto, kg_por_hectare, hectares):
        kg_necessarios = kg_por_hectare * hectares
        insumo = {
            "produto": produto,
            "kg_por_hectare": kg_por_hectare,
            "hectares": hectares,
            "kg_necessarios": kg_necessarios
        }
        self.insumos_milho.append(insumo)
        return kg_necessarios

def mostrar_menu():
    print("\n" + "="*50)
    print("🌱 FARMTECH SOLUTIONS - AGRICULTURA DIGITAL 🌱")
    print("="*50)
    print("1. Entrada de dados")
    print("2. Saída de dados")
    print("3. Atualização de dados")
    print("4. Deleção de dados")
    print("5. Sair do programa")
    print("="*50)

def entrada_dados(cultura_data):
    print("\n📊 ENTRADA DE DADOS")
    print("1. Adicionar área de plantio")
    print("2. Adicionar insumos")
    
    opcao = input("Escolha uma opção: ")
    
    if opcao == "1":
        print("\nTipos de cultura:")
        print("1. Soja (área retangular)")
        print("2. Milho (área circular)")
        
        tipo = input("Escolha o tipo de cultura: ")
        
        if tipo == "1":
            largura = float(input("Digite a largura em metros: "))
            comprimento = float(input("Digite o comprimento em metros: "))
            area = cultura_data.adicionar_area_soja(largura, comprimento)
            print(f"✅ Área de soja adicionada: {area:.2f} m²")
        
        elif tipo == "2":
            raio = float(input("Digite o raio em metros: "))
            area = cultura_data.adicionar_area_milho(raio)
            print(f"✅ Área de milho adicionada: {area:.2f} m²")
    
    elif opcao == "2":
        print("\nTipos de cultura para insumos:")
        print("1. Soja (aplicação por metro linear)")
        print("2. Milho (aplicação por hectare)")
        
        tipo = input("Escolha o tipo de cultura: ")
        
        if tipo == "1":
            produto = input("Nome do produto: ")
            ml_por_metro = float(input("ML por metro: "))
            num_ruas = int(input("Número de ruas: "))
            metros_por_rua = float(input("Metros por rua: "))
            litros = cultura_data.adicionar_insumo_soja(produto, ml_por_metro, num_ruas, metros_por_rua)
            print(f"✅ Insumo para soja adicionado: {litros:.2f} litros necessários")
        
        elif tipo == "2":
            produto = input("Nome do produto: ")
            kg_por_hectare = float(input("KG por hectare: "))
            hectares = float(input("Hectares: "))
            kg = cultura_data.adicionar_insumo_milho(produto, kg_por_hectare, hectares)
            print(f"✅ Insumo para milho adicionado: {kg:.2f} kg necessários")

def saida_dados(cultura_data):
    print("\n📈 SAÍDA DE DADOS")
    
    print("\n🌿 DADOS DE SOJA:")
    print(f"Áreas cadastradas: {len(cultura_data.areas_soja)}")
    for i, area in enumerate(cultura_data.areas_soja):
        print(f"  {i+1}. Largura: {area['largura']}m, Comprimento: {area['comprimento']}m, Área: {area['area']:.2f}m²")
    
    print(f"\nInsumos cadastrados: {len(cultura_data.insumos_soja)}")
    for i, insumo in enumerate(cultura_data.insumos_soja):
        print(f"  {i+1}. {insumo['produto']}: {insumo['litros_necessarios']:.2f}L necessários")
    
    print("\n🌽 DADOS DE MILHO:")
    print(f"Áreas cadastradas: {len(cultura_data.areas_milho)}")
    for i, area in enumerate(cultura_data.areas_milho):
        print(f"  {i+1}. Raio: {area['raio']}m, Área: {area['area']:.2f}m²")
    
    print(f"\nInsumos cadastrados: {len(cultura_data.insumos_milho)}")
    for i, insumo in enumerate(cultura_data.insumos_milho):
        print(f"  {i+1}. {insumo['produto']}: {insumo['kg_necessarios']:.2f}kg necessários")

def atualizar_dados(cultura_data):
    print("\n🔄 ATUALIZAÇÃO DE DADOS")
    print("1. Atualizar área de soja")
    print("2. Atualizar área de milho")
    print("3. Atualizar insumo de soja")
    print("4. Atualizar insumo de milho")
    
    opcao = input("Escolha uma opção: ")
    
    if opcao == "1" and cultura_data.areas_soja:
        print("Áreas de soja disponíveis:")
        for i, area in enumerate(cultura_data.areas_soja):
            print(f"  {i+1}. Área: {area['area']:.2f}m²")
        
        indice = int(input("Digite o número da área para atualizar: ")) - 1
        if 0 <= indice < len(cultura_data.areas_soja):
            largura = float(input("Nova largura em metros: "))
            comprimento = float(input("Novo comprimento em metros: "))
            cultura_data.areas_soja[indice] = {
                "largura": largura, 
                "comprimento": comprimento, 
                "area": largura * comprimento
            }
            print("✅ Área de soja atualizada!")
    
    elif opcao == "2" and cultura_data.areas_milho:
        print("Áreas de milho disponíveis:")
        for i, area in enumerate(cultura_data.areas_milho):
            print(f"  {i+1}. Área: {area['area']:.2f}m²")
        
        indice = int(input("Digite o número da área para atualizar: ")) - 1
        if 0 <= indice < len(cultura_data.areas_milho):
            raio = float(input("Novo raio em metros: "))
            cultura_data.areas_milho[indice] = {
                "raio": raio,
                "area": math.pi * raio ** 2
            }
            print("✅ Área de milho atualizada!")

def deletar_dados(cultura_data):
    print("\n🗑️ DELEÇÃO DE DADOS")
    print("1. Deletar área de soja")
    print("2. Deletar área de milho")
    print("3. Deletar insumo de soja")
    print("4. Deletar insumo de milho")
    
    opcao = input("Escolha uma opção: ")
    
    if opcao == "1" and cultura_data.areas_soja:
        print("Áreas de soja disponíveis:")
        for i, area in enumerate(cultura_data.areas_soja):
            print(f"  {i+1}. Área: {area['area']:.2f}m²")
        
        indice = int(input("Digite o número da área para deletar: ")) - 1
        if 0 <= indice < len(cultura_data.areas_soja):
            cultura_data.areas_soja.pop(indice)
            print("✅ Área de soja deletada!")
    
    elif opcao == "2" and cultura_data.areas_milho:
        print("Áreas de milho disponíveis:")
        for i, area in enumerate(cultura_data.areas_milho):
            print(f"  {i+1}. Área: {area['area']:.2f}m²")
        
        indice = int(input("Digite o número da área para deletar: ")) - 1
        if 0 <= indice < len(cultura_data.areas_milho):
            cultura_data.areas_milho.pop(indice)
            print("✅ Área de milho deletada!")

def main():
    cultura_data = CulturaData()
    
    while True:
        mostrar_menu()
        opcao = input("Escolha uma opção: ")
        
        if opcao == "1":
            entrada_dados(cultura_data)
        elif opcao == "2":
            saida_dados(cultura_data)
        elif opcao == "3":
            atualizar_dados(cultura_data)
        elif opcao == "4":
            deletar_dados(cultura_data)
        elif opcao == "5":
            print("\n👋 Obrigado por usar o FarmTech Solutions!")
            print("🌱 Agricultura Digital em suas mãos!")
            sys.exit(0)
        else:
            print("❌ Opção inválida! Tente novamente.")

if __name__ == "__main__":
    main()