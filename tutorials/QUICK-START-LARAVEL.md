# Quick Start: Laravel Blog System (⏱️ 45 minutos)

**Objetivo**: Criar blog completo com admin panel para aprender full-stack Laravel + TDD

## 🚀 Setup Rápido (10 min)

### 1. Criar projeto e configurar Claude Code
```bash
# Projeto Laravel
composer create-project laravel/laravel simple-blog
cd simple-blog

# Configurar SQLite (mais simples)
echo "DB_CONNECTION=sqlite" >> .env
echo "DB_DATABASE=database/database.sqlite" >> .env
touch database/database.sqlite

# Copiar configuração Claude Code
cp -r /path/to/Tutorial-Claude-Code/.claude .

# Configurar PRD
mkdir -p docs
cp /path/to/Tutorial-Claude-Code/examples/SIMPLE-BLOG-PRD.md docs/PRD.md

# Dependências essenciais
composer require livewire/livewire filament/filament

# Instalar Filament
php artisan filament:install --panels

# Executar migrações básicas
php artisan migrate

# EXECUTAR: Reconhecer projeto
/init
```

## ⚙️ Design do Sistema (8 min)

### 2. Executar comando de design
```bash
# Ativar TDD primeiro
/output-style
# Selecionar: "Pragmatic Test Driven Developer"

# Design automático full-stack
/dev:design-fullstack "docs/PRD.md"
```

**O que acontece:**
- `orchestrator` analisa o PRD full-stack
- `ui-designer` cria wireframes para público + admin
- `laravel-specialist` define arquitetura backend
- `livewire-expert` planeja componentes reativos

## 💻 Implementação TDD (20 min)

### 3. Implementar com TDD rigoroso
```bash
# Implementação automática com ciclos RED → GREEN → VERIFY
/dev:implement-mvp .claude/outputs/design/projects/simple-blog/[timestamp] .
```

**Ciclos TDD esperados:**
1. **🔴 RED**: Teste Model Post falha
2. **🟢 GREEN**: Implementar Post model + migration
3. **✅ VERIFY**: Confirmar model criado corretamente

4. **🔴 RED**: Teste Filament Resource falha
5. **🟢 GREEN**: Implementar PostResource admin
6. **✅ VERIFY**: Confirmar admin funcionando

7. **🔴 RED**: Teste Homepage Livewire falha
8. **🟢 GREEN**: Implementar HomePage component
9. **✅ VERIFY**: Confirmar posts listados

10. **🔴 RED**: Teste página individual falha
11. **🟢 GREEN**: Implementar PostPage component
12. **✅ VERIFY**: Confirmar post individual abrindo

## 🧪 Configurar Admin e Dados (5 min)

### 4. Criar usuário admin e dados de teste
```bash
# Criar admin user
php artisan make:filament-user
# Email: admin@example.com
# Password: password

# Seeder para posts de exemplo (será criado automaticamente)
php artisan db:seed

# Servidor de desenvolvimento
php artisan serve
```

## ✅ Verificação Final (2 min)

### 5. Testar sistema completo
```bash
# Testes automatizados
php artisan test

# Acessar aplicação
# Frontend: http://localhost:8000
# Admin: http://localhost:8000/admin
```

## 📸 Preview do Resultado

### **Frontend Público**
```
╔════════════════════════════════════╗
║             📝 Meu Blog            ║
╠════════════════════════════════════╣
║ 🖼️ [Imagem] Post Mais Recente      ║
║   Título: "Como usar Laravel"      ║
║   Resumo: Este post ensina...      ║
║   📅 15 de Janeiro, 2024           ║
╠════════════════════════════════════╣
║ • Post Anterior 2                  ║
║   Resumo breve... 📅 14/01         ║
║ • Post Anterior 1                  ║  
║   Resumo breve... 📅 13/01         ║
╠════════════════════════════════════╣
║     [← Anterior] [Próximo →]       ║
╚════════════════════════════════════╝
```

### **Admin Panel (Filament)**
```
╔════════════════════════════════════╗
║          📊 Blog Admin             ║
╠════════════════════════════════════╣
║ Posts    │ 📝 8 total             ║
║          │ 5 publicados           ║
║          │ 3 rascunhos            ║
╠════════════════════════════════════╣
║ ➕ Novo Post                       ║
╠════════════════════════════════════╣
║ 📋 Lista de Posts                  ║
║ Título        │ Status │ Data      ║
║ Post Novo     │ Draft  │ Hoje      ║
║ Como Laravel  │ Pub.   │ 14/01     ║
║ Tutorial PHP  │ Pub.   │ 13/01     ║
╚════════════════════════════════════╝
```

## 🎯 O que você aprendeu

### **Claude Code Full-Stack**
- ✅ Como usar `/dev:design-fullstack` 
- ✅ Coordenação automática de agentes Laravel
- ✅ TDD com PestPHP (Feature tests)
- ✅ Implementação backend + frontend simultânea

### **Laravel Stack Moderno**
- ✅ Laravel 11.x + Livewire 3 integration
- ✅ Filament 4 admin panel completo
- ✅ SQLite para desenvolvimento rápido
- ✅ Eloquent relationships e migrations

### **Full-Stack TDD**
- ✅ Model tests → Feature tests → Browser tests
- ✅ Testes para Livewire components
- ✅ Testes para Filament resources
- ✅ End-to-end workflow testing

## 🔧 Features Implementadas

### **Frontend Público (Livewire)**
- ✅ Homepage com lista de posts
- ✅ Página individual do post
- ✅ Design responsivo mobile-first
- ✅ Paginação automática

### **Admin Panel (Filament)**
- ✅ CRUD completo de posts
- ✅ Editor de texto rico
- ✅ Upload de imagem destacada
- ✅ Status: rascunho/publicado
- ✅ Filtros e busca

### **Backend (Laravel)**
- ✅ Post model com relationships
- ✅ Migrations e seeders
- ✅ Route model binding
- ✅ SQLite database configurado

## 🚀 Próximos Passos

Agora que dominou Laravel básico, experimente:

1. **Tutorial Completo**: [TUTORIAL-LARAVEL-FULLSTACK.md](TUTORIAL-LARAVEL-FULLSTACK.md)
2. **Sistema mais complexo**: [LARAVEL-ECOMMERCE-PRD.md](../examples/LARAVEL-ECOMMERCE-PRD.md)
3. **Outra tecnologia**: [QUICK-START-FLUTTER.md](QUICK-START-FLUTTER.md)

## 🆘 Troubleshooting Rápido

**❌ Erro de permissão SQLite**
```bash
# Ajustar permissões
chmod 664 database/database.sqlite
chmod 755 database/
```

**❌ Filament não instala**
```bash
# Verificar versão PHP
php --version  # Precisa 8.1+
composer install
```

**❌ Livewire não funciona**
```bash
# Publicar assets
php artisan livewire:publish --config
php artisan view:clear
```

**❌ Admin user não criado**
```bash
# Criar manualmente
php artisan tinker
User::create(['name'=>'Admin','email'=>'admin@test.com','password'=>bcrypt('password')]);
```

## 📊 Comandos Úteis

### **Desenvolvimento**
```bash
php artisan serve          # Servidor local
php artisan tinker         # REPL Laravel
php artisan route:list     # Ver todas rotas
php artisan migrate:fresh  # Reset database
```

### **Filament**
```bash
php artisan make:filament-resource Post  # Novo resource
php artisan filament:make-widget Stats   # Widget dashboard
```

### **Livewire**
```bash
php artisan make:livewire HomePage        # Novo component
php artisan livewire:make PostList       # Alternate syntax
```

---

**⏱️ Tempo real: 40-50 minutos**
**✅ Complexidade: Intermediário**  
**🎯 Ideal para: Experiência full-stack completa**