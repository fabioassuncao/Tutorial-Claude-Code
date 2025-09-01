# Tutorial: Desenvolvimento Full-Stack com Laravel
## Laravel 11.x + Livewire v3 + Alpine.js v3 + Filament v4

### 🎯 Visão Geral

Este tutorial demonstra como usar Claude Code e agentes de IA especializados para desenvolver aplicações **full-stack Laravel** completas usando metodologia TDD. Cobrimos desde a criação do PRD até o deploy de sistemas robustos com painel administrativo.

**Stack Principal**: Laravel 11.x + Livewire 3 + Alpine.js 3 + Filament 4 + PostgreSQL

---

## 🚀 Configuração Inicial

### 1.2 Agentes Especializados para Laravel

#### **Estratégia & Arquitetura**
- `prd-writer` - PRDs para sistemas full-stack
- `system-architect` - Arquitetura Laravel moderna
- `orchestrator` - Coordenação multi-agente

#### **Design & Interface**
- `ui-designer` - Wireframes para web e admin
- `livewire-expert` - Componentes Livewire reativos

#### **Implementação Full-Stack**
- `laravel-specialist` - Backend + APIs Laravel

#### **Testes & Qualidade**
- `api-backend-tester` - Testes Feature/Unit Laravel
- `web-test-expert` - Testes de interface Livewire

### 1.3 Output Style TDD Obrigatório

```bash
/output-style
# Selecionar: "Pragmatic Test Driven Developer"
```

---

## 📝 Fase 1: Criação do PRD Laravel

### 2.1 Template PRD Full-Stack

```markdown
# [Sistema] - Product Requirements Document

## 1. Visão Geral
- **Objetivo**: [Sistema completo que resolve problema específico]
- **Tipo**: Sistema Full-stack Laravel
- **Usuários-alvo**: [Admins, usuários finais, clientes, etc.]

## 2. Funcionalidades Core

### 2.1 Frontend Público (Livewire)
- **Como visitante**, eu quero [funcionalidade pública]
- **Critérios de aceitação**:
  - [ ] Interface responsiva com Tailwind
  - [ ] Componentes Livewire reativos
  - [ ] Validação em tempo real
  - [ ] Performance <200ms

### 2.2 Painel Administrativo (Filament)
- **Como admin**, eu quero [gerenciar recursos]
- **Critérios de aceitação**:
  - [ ] CRUD completo para todas entidades
  - [ ] Filtros e busca avançada
  - [ ] Relatórios e exports
  - [ ] Permissões granulares

### 2.3 API REST (Sanctum)
- **Como desenvolvedor**, eu quero APIs para integração
- **Critérios de aceitação**:
  - [ ] Endpoints RESTful documentados
  - [ ] Autenticação JWT com Sanctum
  - [ ] Rate limiting e throttling
  - [ ] Versionamento de API

## 3. Requisitos Técnicos

### 3.1 Stack Full-Stack Laravel
- **Backend**: Laravel 11.x + PHP 8.2+
- **Frontend**: Livewire 3 + Alpine.js 3
- **Admin**: Filament 4 + Tailwind CSS
- **Database**: PostgreSQL + Redis cache
- **Auth**: Laravel Sanctum + Filament Shield
- **Queue**: Redis + Horizon
- **Storage**: AWS S3 + CloudFront

### 3.2 Arquitetura
- **Padrões**: Repository + Service Layer
- **Testing**: Feature + Unit + Browser tests
- **API**: RESTful com Laravel API Resources
- **Real-time**: Laravel Echo + Pusher
- **Jobs**: Queue workers para operações assíncronas

## 4. Critérios de Sucesso
- [ ] Sistema completo funcionando (público + admin + API)
- [ ] Testes passando >90% cobertura
- [ ] Performance API <500ms
- [ ] Interface responsiva mobile-first
- [ ] Deploy automatizado funcionando
```

### 2.2 Exemplo Prático: E-commerce Admin

Consulte o PRD completo: **[E-commerce Admin Dashboard](examples/LARAVEL-ECOMMERCE-PRD.md)**

Sistema completo de gestão para e-commerce com:
- Frontend público para catálogo
- Painel Filament para administração
- APIs para mobile/integrações
- Relatórios e analytics integrados

---

## 🏗️ Fase 2: Design Full-Stack

### 3.1 Comando de Design Laravel

```bash
# Design sistema Laravel completo
/dev:design-fullstack "docs/ecommerce-prd.md"
```

**Agentes ativados automaticamente:**
- `orchestrator` - Coordenação geral
- `ui-designer` - Wireframes web + admin
- `laravel-specialist` - Arquitetura backend
- `livewire-expert` - Componentes reativos

### 3.2 Outputs do Design

```
.claude/outputs/design/projects/ecommerce-admin/[timestamp]/
├── MANIFEST.md                    # Registry completo
├── IMPLEMENTATION_PLAN.md         # Plano Laravel
└── agents/
    ├── ui-designer/
    │   ├── public-wireframes.md
    │   ├── admin-wireframes.md
    │   └── mobile-responsive.md
    ├── laravel-specialist/
    │   ├── database-schema.md
    │   ├── api-endpoints.md
    │   ├── service-architecture.md
    │   └── security-strategy.md
    ├── livewire-expert/
    │   ├── component-architecture.md
    │   ├── real-time-features.md
    │   └── form-validations.md
```

---

## ⚙️ Fase 3: Setup do Projeto Laravel

### 4.1 Configuração do Boilerplate

#### **Passo 1: Criar e Configurar Projeto Base**

```bash
# Criar projeto Laravel
composer create-project laravel/laravel ecommerce-admin
cd ecommerce-admin

# Configurar ambiente
cp .env.example .env
php artisan key:generate

# Configurar database PostgreSQL
# Editar .env:
DB_CONNECTION=pgsql
DB_HOST=127.0.0.1
DB_PORT=5432
DB_DATABASE=ecommerce_admin
DB_USERNAME=postgres
DB_PASSWORD=password

# Cache & Queue
CACHE_DRIVER=redis
QUEUE_CONNECTION=redis
SESSION_DRIVER=redis
```

#### **Passo 2: Instalar Dependências Complete**

```bash
# Livewire 3
composer require livewire/livewire

# Filament 4
composer require filament/filament
php artisan filament:install --panels

# Alpine.js & Tailwind (vem com Livewire)
npm install alpinejs @tailwindcss/forms @tailwindcss/typography

# Dependências essenciais
composer require laravel/sanctum         # API auth
composer require spatie/laravel-permission  # Roles
composer require intervention/image      # Image processing
composer require barryvdh/laravel-dompdf   # PDF generation
composer require pusher/pusher-php-server  # Real-time
composer require laravel/horizon         # Queue monitoring

# Build assets
npm install && npm run build
```

#### **Passo 3: Configurar Banco e Migrações Base**

```bash
# Rodar migrações base
php artisan migrate

# Publicar configurações
php artisan vendor:publish --tag=sanctum-migrations
php artisan vendor:publish --provider="Spatie\Permission\PermissionServiceProvider"

# Configurar Filament admin user
php artisan make:filament-user
```

#### **Passo 4: Configurar Claude Code no Projeto**

```bash
# IMPORTANTE: Copiar configuração Claude
cp -r /path/to/tutorial-repo/.claude .

# Configurar PRD no projeto
mkdir -p docs
cp /path/to/tutorial-repo/examples/LARAVEL-ECOMMERCE-PRD.md docs/PRD.md

# EXECUTAR: Comando init do Claude Code
/init
```

**O comando `/init` irá:**
- ✅ Analisar o projeto Laravel existente
- ✅ Detectar dependências instaladas (Livewire, Filament, etc.)
- ✅ Ler o PRD.md disponível
- ✅ Gerar CLAUDE.md otimizado para este projeto específico
- ✅ Configurar agentes apropriados para Laravel full-stack

#### **Passo 5: Verificar Configuração**

Após `/init`, verifique se foi criado:
- ✅ `CLAUDE.md` - Orientações específicas do projeto
- ✅ Detecção das dependências Laravel instaladas  
- ✅ Reconhecimento da estrutura MVC + Livewire
- ✅ Configuração de agentes Laravel especializados

### 4.2 Projeto Pronto para Development

Com o boilerplate configurado e `/init` executado, seu projeto Laravel agora tem:

✅ **Stack completa** - Laravel + Livewire + Filament instalados  
✅ **PRD definido** - Documento de requisitos no projeto  
✅ **Claude Code configurado** - CLAUDE.md gerado automaticamente  
✅ **Agentes ativos** - Especializados para Laravel detectados  
✅ **Database setup** - Migrações base executadas  

**Próximo passo**: Fase 4 - Design da aplicação

---

## 🏗️ Fase 4: Design Full-Stack (com projeto configurado)

### 5.1 Comando de Design Laravel

```bash
# Design sistema Laravel completo (agora com boilerplate configurado)
/dev:design-fullstack "docs/PRD.md"
```

**Vantagem do boilerplate configurado:**
- ✅ Claude Code **reconhece** Laravel + Livewire + Filament instalados
- ✅ **Não alucina** sobre dependências inexistentes
- ✅ **Foca na implementação** das funcionalidades do PRD
- ✅ **Otimiza tokens** usando informações reais do projeto

**Agentes ativados automaticamente:**
- `orchestrator` - Coordenação geral
- `ui-designer` - Wireframes web + admin
- `laravel-specialist` - Arquitetura backend
- `livewire-expert` - Componentes reativos

### 5.2 Outputs do Design

```
.claude/outputs/design/projects/ecommerce-admin/[timestamp]/
├── MANIFEST.md                    # Registry completo
├── IMPLEMENTATION_PLAN.md         # Plano Laravel
└── agents/
    ├── ui-designer/
    │   ├── public-wireframes.md
    │   ├── admin-wireframes.md
    │   └── mobile-responsive.md
    ├── laravel-specialist/
    │   ├── database-schema.md
    │   ├── api-endpoints.md
    │   ├── service-architecture.md
    │   └── security-strategy.md
    ├── livewire-expert/
    │   ├── component-architecture.md
    │   ├── real-time-features.md
    │   └── form-validations.md
```

---

## ⚙️ Fase 5: Configuração de Testes (pós-boilerplate)

```bash
# Dependências de teste
composer require --dev laravel/dusk      # Browser tests
composer require --dev pestphp/pest      # Modern testing
composer require --dev pestphp/pest-plugin-laravel

# Configurar Pest
php artisan pest:install

# Configurar Dusk para Livewire
php artisan dusk:install
```

### 4.4 Estrutura de Pastas Laravel

```
app/
├── Http/
│   ├── Controllers/     # API Controllers
│   ├── Requests/        # Form Requests
│   ├── Resources/       # API Resources
│   └── Livewire/        # Livewire Components
├── Models/              # Eloquent Models
├── Services/            # Business Logic
├── Filament/
│   ├── Resources/       # Admin Resources
│   └── Widgets/         # Dashboard Widgets
└── Jobs/                # Queue Jobs
```

---

## 🔄 Fase 6: Implementação TDD Laravel

### 5.1 Ativar TDD Estrito

```bash
# OBRIGATÓRIO: Modo TDD
/output-style
# Selecionar: "Pragmatic Test Driven Developer"
```

### 5.2 Comando de Implementação

```bash
# Implementar MVP Laravel com TDD
/dev:implement-mvp .claude/outputs/design/projects/ecommerce-admin/[timestamp] .
```

### 5.3 Ciclos TDD Laravel Completos

#### **Ciclo 1: Model + Migration (RED → GREEN → VERIFY)**

```bash
# RED: Teste falha - Product model não existe
```
```php
// tests/Feature/ProductTest.php
test('can create product with valid data', function () {
    $productData = [
        'name' => 'Test Product',
        'slug' => 'test-product',
        'price' => 99.99,
        'description' => 'Test description',
        'category_id' => Category::factory()->create()->id,
    ];
    
    $product = Product::create($productData);
    
    expect($product)->toBeInstanceOf(Product::class)
        ->and($product->name)->toBe('Test Product')
        ->and($product->price)->toBe(99.99);
        
    $this->assertDatabaseHas('products', $productData);
});
```

```bash
# GREEN: Implementação mínima
```
```php
// database/migrations/create_products_table.php
Schema::create('products', function (Blueprint $table) {
    $table->id();
    $table->string('name');
    $table->string('slug')->unique();
    $table->decimal('price', 10, 2);
    $table->text('description')->nullable();
    $table->foreignId('category_id')->constrained();
    $table->enum('status', ['active', 'inactive'])->default('active');
    $table->timestamps();
    
    $table->index(['status', 'category_id']);
    $table->fullText(['name', 'description']);
});

// app/Models/Product.php
class Product extends Model
{
    protected $fillable = [
        'name', 'slug', 'price', 'description', 'category_id', 'status'
    ];
    
    protected $casts = [
        'price' => 'decimal:2',
        'status' => 'string',
    ];
    
    public function category(): BelongsTo
    {
        return $this->belongsTo(Category::class);
    }
}
```

```bash
# VERIFY: Executar teste
php artisan test --filter=ProductTest
# ✅ "Test passing - Product model created. Please verify before continuing."
```

#### **Ciclo 2: Livewire Component (RED → GREEN → VERIFY)**

```bash
# RED: Teste falha - Componente não existe
```
```php
// tests/Feature/Livewire/CreateProductTest.php
use Livewire\Livewire;

test('can create product via livewire component', function () {
    $category = Category::factory()->create();
    
    Livewire::test(CreateProduct::class)
        ->set('name', 'New Product')
        ->set('price', 149.99)
        ->set('description', 'New product description')
        ->set('category_id', $category->id)
        ->call('save')
        ->assertHasNoErrors()
        ->assertDispatched('product-created');
        
    $this->assertDatabaseHas('products', [
        'name' => 'New Product',
        'price' => 149.99
    ]);
});
```

```bash
# GREEN: Componente Livewire mínimo
```
```php
// app/Http/Livewire/CreateProduct.php
class CreateProduct extends Component
{
    public string $name = '';
    public float $price = 0;
    public string $description = '';
    public int $category_id = 0;
    
    protected $rules = [
        'name' => 'required|string|max:255',
        'price' => 'required|numeric|min:0',
        'description' => 'nullable|string',
        'category_id' => 'required|exists:categories,id',
    ];
    
    public function save()
    {
        $this->validate();
        
        Product::create([
            'name' => $this->name,
            'slug' => Str::slug($this->name),
            'price' => $this->price,
            'description' => $this->description,
            'category_id' => $this->category_id,
        ]);
        
        $this->dispatch('product-created');
        $this->reset();
        session()->flash('success', 'Product created successfully!');
    }
    
    public function render()
    {
        return view('livewire.create-product', [
            'categories' => Category::all()
        ]);
    }
}
```

```blade
{{-- resources/views/livewire/create-product.blade.php --}}
<div class="max-w-md mx-auto bg-white rounded-lg shadow-md p-6">
    <form wire:submit="save" class="space-y-4">
        <div>
            <label class="block text-sm font-medium text-gray-700">Product Name</label>
            <input type="text" wire:model="name" 
                   class="mt-1 block w-full rounded-md border-gray-300">
            @error('name') <span class="text-red-500 text-sm">{{ $message }}</span> @enderror
        </div>
        
        <div>
            <label class="block text-sm font-medium text-gray-700">Price</label>
            <input type="number" step="0.01" wire:model="price" 
                   class="mt-1 block w-full rounded-md border-gray-300">
            @error('price') <span class="text-red-500 text-sm">{{ $message }}</span> @enderror
        </div>
        
        <div>
            <label class="block text-sm font-medium text-gray-700">Category</label>
            <select wire:model="category_id" 
                    class="mt-1 block w-full rounded-md border-gray-300">
                <option value="">Select Category</option>
                @foreach($categories as $category)
                    <option value="{{ $category->id }}">{{ $category->name }}</option>
                @endforeach
            </select>
            @error('category_id') <span class="text-red-500 text-sm">{{ $message }}</span> @enderror
        </div>
        
        <div>
            <label class="block text-sm font-medium text-gray-700">Description</label>
            <textarea wire:model="description" rows="3"
                      class="mt-1 block w-full rounded-md border-gray-300"></textarea>
        </div>
        
        <button type="submit" 
                class="w-full bg-blue-600 text-white py-2 px-4 rounded-md hover:bg-blue-700">
            Create Product
        </button>
    </form>
</div>
```

#### **Ciclo 3: Filament Admin Resource (RED → GREEN → VERIFY)**

```bash
# RED: Teste falha - Admin resource não existe
```
```php
// tests/Feature/Filament/ProductResourceTest.php
test('admin can manage products via filament', function () {
    $admin = User::factory()->create();
    $this->actingAs($admin);
    
    // Test create page exists
    $this->get('/admin/products/create')
        ->assertOk()
        ->assertSee('Create Product');
        
    // Test product creation
    $categoryId = Category::factory()->create()->id;
    $productData = [
        'name' => 'Admin Product',
        'price' => 299.99,
        'category_id' => $categoryId,
        'description' => 'Created via admin',
        'status' => 'active'
    ];
    
    $this->post('/admin/products', $productData)
        ->assertRedirect();
        
    $this->assertDatabaseHas('products', [
        'name' => 'Admin Product',
        'price' => 299.99
    ]);
});
```

```bash
# GREEN: Filament Resource mínimo
```
```php
// app/Filament/Resources/ProductResource.php
class ProductResource extends Resource
{
    protected static ?string $model = Product::class;
    protected static ?string $navigationIcon = 'heroicon-o-shopping-bag';
    
    public static function form(Form $form): Form
    {
        return $form->schema([
            TextInput::make('name')
                ->required()
                ->maxLength(255)
                ->live(onBlur: true)
                ->afterStateUpdated(fn (Set $set, ?string $state) => 
                    $set('slug', Str::slug($state))),
                    
            TextInput::make('slug')
                ->required()
                ->maxLength(255)
                ->unique(ignoreRecord: true),
                
            TextInput::make('price')
                ->required()
                ->numeric()
                ->prefix('$'),
                
            Select::make('category_id')
                ->relationship('category', 'name')
                ->required(),
                
            Textarea::make('description')
                ->rows(4),
                
            Select::make('status')
                ->options([
                    'active' => 'Active',
                    'inactive' => 'Inactive'
                ])
                ->default('active')
                ->required(),
        ]);
    }
    
    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                TextColumn::make('name')->searchable(),
                TextColumn::make('category.name'),
                TextColumn::make('price')->money('usd'),
                BadgeColumn::make('status')
                    ->colors([
                        'success' => 'active',
                        'danger' => 'inactive',
                    ]),
                TextColumn::make('created_at')->dateTime(),
            ])
            ->filters([
                SelectFilter::make('status')
                    ->options([
                        'active' => 'Active',
                        'inactive' => 'Inactive'
                    ]),
                SelectFilter::make('category')
                    ->relationship('category', 'name'),
            ])
            ->actions([
                Tables\Actions\EditAction::make(),
                Tables\Actions\DeleteAction::make(),
            ]);
    }
}
```

#### **Ciclo 4: API Endpoints (RED → GREEN → VERIFY)**

```bash
# RED: API tests failing
```
```php
// tests/Feature/Api/ProductApiTest.php
test('can get products via api', function () {
    $products = Product::factory()->count(5)->create();
    
    $response = $this->getJson('/api/products');
    
    $response->assertOk()
        ->assertJsonStructure([
            'data' => [
                '*' => ['id', 'name', 'price', 'category', 'created_at']
            ],
            'links',
            'meta'
        ]);
});

test('can create product via api with auth', function () {
    $user = User::factory()->create();
    $token = $user->createToken('test')->plainTextToken;
    
    $categoryId = Category::factory()->create()->id;
    $productData = [
        'name' => 'API Product',
        'price' => 199.99,
        'category_id' => $categoryId,
        'description' => 'Created via API'
    ];
    
    $response = $this->postJson('/api/products', $productData, [
        'Authorization' => 'Bearer ' . $token
    ]);
    
    $response->assertStatus(201)
        ->assertJson([
            'data' => [
                'name' => 'API Product',
                'price' => '199.99'
            ]
        ]);
});
```

```bash
# GREEN: API Controller + Routes
```
```php
// app/Http/Controllers/Api/ProductController.php
class ProductController extends Controller
{
    public function index(): JsonResponse
    {
        $products = Product::with('category')
            ->paginate(20);
            
        return response()->json([
            'data' => ProductResource::collection($products->items()),
            'links' => [
                'first' => $products->url(1),
                'last' => $products->url($products->lastPage()),
                'prev' => $products->previousPageUrl(),
                'next' => $products->nextPageUrl(),
            ],
            'meta' => [
                'current_page' => $products->currentPage(),
                'total' => $products->total(),
            ]
        ]);
    }
    
    public function store(StoreProductRequest $request): JsonResponse
    {
        $product = Product::create([
            'name' => $request->name,
            'slug' => Str::slug($request->name),
            'price' => $request->price,
            'description' => $request->description,
            'category_id' => $request->category_id,
        ]);
        
        return response()->json([
            'message' => 'Product created successfully',
            'data' => new ProductResource($product)
        ], 201);
    }
}

// app/Http/Resources/ProductResource.php
class ProductResource extends JsonResource
{
    public function toArray(Request $request): array
    {
        return [
            'id' => $this->id,
            'name' => $this->name,
            'slug' => $this->slug,
            'price' => number_format($this->price, 2),
            'description' => $this->description,
            'status' => $this->status,
            'category' => new CategoryResource($this->whenLoaded('category')),
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
        ];
    }
}

// routes/api.php
Route::middleware('auth:sanctum')->group(function () {
    Route::apiResource('products', ProductController::class);
});

Route::get('products', [ProductController::class, 'index']); // Public listing
```

### 5.4 Comandos de Teste Laravel

```bash
# Testes completos
php artisan test

# Testes específicos
php artisan test --filter=ProductTest
php artisan test tests/Feature/Livewire/

# Com cobertura
php artisan test --coverage

# Dusk browser tests
php artisan dusk

# Pest parallel testing
./vendor/bin/pest --parallel
```

---

## 🚀 Fase 7: Deploy e Produção

### 6.1 Configuração de Produção

#### **Forge/Vapor Deploy**
```bash
# Laravel Forge
git push production main

# Laravel Vapor
vapor deploy production

# Docker Deploy
docker build -t ecommerce-admin .
docker run -p 80:8000 ecommerce-admin
```

#### **Environment Production**
```bash
# .env.production
APP_ENV=production
APP_DEBUG=false
APP_URL=https://admin.mystore.com

DB_CONNECTION=pgsql
DB_HOST=production-db.amazonaws.com
REDIS_HOST=production-redis.amazonaws.com

QUEUE_CONNECTION=redis
CACHE_DRIVER=redis
SESSION_DRIVER=redis

AWS_ACCESS_KEY_ID=your-key
AWS_SECRET_ACCESS_KEY=your-secret
AWS_DEFAULT_REGION=us-east-1
AWS_BUCKET=your-bucket

PUSHER_APP_ID=your-pusher-id
PUSHER_APP_KEY=your-pusher-key
PUSHER_APP_SECRET=your-pusher-secret
```

### 6.2 Otimizações de Performance

```bash
# Caching otimizado
php artisan config:cache
php artisan route:cache
php artisan view:cache
php artisan event:cache

# Queue workers
php artisan horizon:publish
php artisan horizon

# Database indexing
php artisan db:show --counts
```

---

## 📊 Recursos Avançados Laravel

### 7.1 Real-time com Laravel Echo

```php
// Event broadcasting
class OrderStatusChanged implements ShouldBroadcast
{
    public function __construct(public Order $order) {}
    
    public function broadcastOn(): array
    {
        return [
            new Channel('orders'),
            new PrivateChannel('order.' . $this->order->id),
        ];
    }
}

// Livewire real-time
class OrderDashboard extends Component
{
    #[On('echo:orders,OrderStatusChanged')]
    public function handleOrderUpdate($event)
    {
        $this->loadOrders();
        $this->dispatch('order-updated', $event);
    }
}
```

### 7.2 Jobs e Queues

```php
// Background job
class ProcessProductImages implements ShouldQueue
{
    public function __construct(
        public Product $product,
        public array $images
    ) {}
    
    public function handle(): void
    {
        foreach ($this->images as $image) {
            $processedImage = Image::make($image)
                ->resize(800, 600)
                ->save();
                
            $this->product->images()->create([
                'path' => $processedImage->path
            ]);
        }
    }
}

// Dispatch job
ProcessProductImages::dispatch($product, $uploadedImages);
```

### 7.3 Filament Widgets Customizados

```php
// Dashboard widget
class SalesOverview extends BaseWidget
{
    protected static string $view = 'filament.widgets.sales-overview';
    
    public function getViewData(): array
    {
        return [
            'totalSales' => Order::sum('total'),
            'todaySales' => Order::whereDate('created_at', today())->sum('total'),
            'totalOrders' => Order::count(),
            'pendingOrders' => Order::where('status', 'pending')->count(),
        ];
    }
}
```

---

## 🎯 Checklist de Projeto Laravel Completo

### **Backend (Laravel)**
- [ ] Models com relationships otimizados
- [ ] Migrations com indexes apropriados
- [ ] Service layer para business logic
- [ ] Repository pattern implementado
- [ ] API Resources para transformação
- [ ] Queue jobs para operações assíncronas
- [ ] Event/Listener system configurado

### **Frontend (Livewire)**
- [ ] Componentes reativos funcionando
- [ ] Validação real-time
- [ ] File uploads otimizados
- [ ] Real-time updates com Echo
- [ ] Interface responsiva mobile-first

### **Admin (Filament)**
- [ ] Resources para todas entidades
- [ ] Dashboard com widgets informativos
- [ ] Filtros e busca avançada
- [ ] Bulk actions implementadas
- [ ] Relatórios e exports funcionando
- [ ] Sistema de permissões ativo

### **API (Sanctum)**
- [ ] Endpoints RESTful documentados
- [ ] Autenticação JWT funcionando
- [ ] Rate limiting configurado
- [ ] Versionamento implementado
- [ ] API Resources consistentes

### **Testes**
- [ ] Feature tests >90% cobertura
- [ ] Unit tests para services
- [ ] Browser tests para Livewire
- [ ] API tests para todos endpoints
- [ ] Performance tests executando

### **Deploy**
- [ ] Ambiente de produção configurado
- [ ] CI/CD pipeline funcionando
- [ ] Monitoramento ativo (Horizon, Telescope)
- [ ] Backup automatizado
- [ ] SSL certificates configurados

---

## 📚 Comandos de Referência Laravel

### **Artisan Essenciais**
```bash
# Desenvolvimento
php artisan make:model Product -mfrs
php artisan make:livewire CreateProduct
php artisan make:filament-resource Product
php artisan make:job ProcessImages
php artisan make:test ProductTest

# Database
php artisan migrate:fresh --seed
php artisan db:seed --class=ProductSeeder

# Queues
php artisan queue:work
php artisan horizon
php artisan queue:failed

# Cache
php artisan cache:clear
php artisan config:clear
php artisan view:clear
```

**Esta metodologia Laravel garante sistemas full-stack robustos, escaláveis e maintíveis através de TDD rigoroso e arquitetura moderna com Livewire + Filament.**