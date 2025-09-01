# Simple Blog System - Product Requirements Document

## 1. Visão Geral
- **Objetivo**: Sistema básico de blog com painel administrativo
- **Tipo**: Sistema Full-stack Laravel
- **Usuários-alvo**: Blogueiros individuais, pequenas empresas

## 2. Funcionalidades Core

### 2.1 Frontend Público (Livewire)
**Como visitante**, eu quero ler posts do blog em uma interface limpa

**Critérios de aceitação**:
- [ ] Lista de posts na homepage (título, resumo, data)
- [ ] Página individual do post com conteúdo completo
- [ ] Design responsivo mobile-first
- [ ] Breadcrumbs para navegação
- [ ] Paginação simples (anterior/próximo)

### 2.2 Painel Administrativo (Filament)
**Como admin**, eu quero gerenciar posts facilmente

**Critérios de aceitação**:
- [ ] Login admin simples
- [ ] CRUD completo de posts (criar, editar, deletar, listar)
- [ ] Editor de texto rico básico
- [ ] Status do post: rascunho/publicado
- [ ] Preview antes de publicar

### 2.3 Gestão de Conteúdo
**Como admin**, eu quero organizar o conteúdo do blog

**Critérios de aceitação**:
- [ ] Upload de imagem destacada para posts
- [ ] Slug automático baseado no título
- [ ] Data de publicação configurável
- [ ] Filtros por status no admin

## 3. Stack Técnica
- **Backend**: Laravel 11.x + PHP 8.2+
- **Frontend**: Livewire 3 + Alpine.js 3
- **Admin**: Filament 4 + Tailwind CSS
- **Database**: SQLite (simplificar setup)
- **Storage**: Local filesystem
- **Testing**: PestPHP Feature tests

## 4. Estrutura de Dados

```php
// Post Model
class Post extends Model
{
    protected $fillable = [
        'title', 'slug', 'excerpt', 'content', 
        'featured_image', 'status', 'published_at'
    ];
    
    protected $casts = [
        'published_at' => 'datetime',
        'status' => 'string'
    ];
}

// Migration
Schema::create('posts', function (Blueprint $table) {
    $table->id();
    $table->string('title');
    $table->string('slug')->unique();
    $table->text('excerpt')->nullable();
    $table->longText('content');
    $table->string('featured_image')->nullable();
    $table->enum('status', ['draft', 'published'])->default('draft');
    $table->timestamp('published_at')->nullable();
    $table->timestamps();
    
    $table->index(['status', 'published_at']);
});
```

## 5. Critérios de Sucesso
- [ ] Sistema funcionando end-to-end
- [ ] Páginas carregam em <1 segundo
- [ ] Admin panel responsivo
- [ ] Upload de imagens funcionando
- [ ] 4 testes Feature principais passando
- [ ] Deploy local funcionando

## 6. Páginas Principais

### **Homepage Pública**
```
+----------------------------------+
|          📝 Meu Blog             |
+----------------------------------+
| 🖼️ Post Recente                  |
| Título do Post Mais Recente      |
| Resumo do post com poucas        |
| linhas para dar contexto...      |
| 📅 15 de Janeiro, 2024           |
+----------------------------------+
| • Post Anterior 2                |
|   Resumo breve... 📅 14/01       |
+----------------------------------+
| • Post Anterior 1                |
|   Resumo breve... 📅 13/01       |
+----------------------------------+
| [← Anterior] [Próximo →]         |
+----------------------------------+
```

### **Admin Dashboard (Filament)**
```
+----------------------------------+
|         📊 Blog Admin            |
+----------------------------------+
| Posts    | 📝 12 total           |
|         | 8 publicados          |
|         | 4 rascunhos           |
+----------------------------------+
| ➕ Novo Post                     |
+----------------------------------+
| 📋 Lista de Posts               |
| Título       | Status | Data     |
| Post Novo    | Draft  | Hoje     |
| Post Antigo  | Pub.   | 14/01    |
+----------------------------------+
```

## 7. Implementação Sugerida (60 mins por fase)

### **Fase 1: Setup Laravel (60 min)**
1. `composer create-project laravel/laravel` + configurações
2. Instalar Livewire + Filament + dependências
3. Model Post + Migration + Seeder

### **Fase 2: Admin Panel (60 min)**
1. Filament Resource para Posts
2. Form com editor básico
3. Upload de imagem funcionando

### **Fase 3: Frontend Público (60 min)**
1. Homepage com lista de posts (Livewire)
2. Página individual do post
3. Layout responsivo básico

### **Fase 4: Features Extras (60 min)**
1. Paginação + filtros
2. Preview de posts
3. Testes Feature essenciais

**Total estimado: ~4h + deploy**

## 8. Testes Essenciais (PestPHP)

```php
// Feature Tests (4 principais)
test('homepage displays published posts');
test('admin can create post via filament');
test('post page displays content correctly');
test('draft posts are not visible publicly');

// Browser Test (1 fluxo completo)
test('complete blog workflow: create → publish → view');
```

## 9. Rotas Principais

```php
// Public routes
Route::get('/', HomePage::class)->name('home');
Route::get('/post/{post:slug}', PostPage::class)->name('post.show');

// Admin routes (Filament handles automatically)
// /admin/posts - CRUD interface
// /admin/login - Admin authentication
```

## 10. Nice-to-Have (Opcional)
- [ ] Sistema de comentários básico
- [ ] Busca por posts
- [ ] Categorias de posts
- [ ] RSS feed
- [ ] SEO meta tags automáticos

---

**Este PRD é perfeito para:**
✅ Primeira experiência full-stack Laravel
✅ Aprender TDD com PestPHP
✅ Testar integração Livewire + Filament
✅ Validar fluxo completo: admin + frontend público
✅ Projeto portfolio real e funcional