# windows-dotfiles

Configuração pessoal do ambiente de terminal no Windows: PowerShell, Oh My Posh (tema **Eclipse**), aliases, funções e ferramentas de CLI.

## 🌑 Sobre o Eclipse

Eclipse é um tema próprio para o Oh My Posh, inspirado em ambientes Linux modernos (KDE Plasma, Catppuccin, Starship). Os princípios do tema:

- **Minimalismo** — só aparece o que é útil (Git só dentro de repositório, Python só em projeto Python, etc.)
- **Contexto** — o prompt muda conforme o diretório e o tipo de projeto
- **Horizontal** — aproveita a largura do terminal em duas linhas (contexto + prompt), em vez de blocos verticais
- **Elegância** — ícones e cores de texto discretas, sem blocos powerline pesados
- **Modularidade** — cada funcionalidade foi adicionada aos poucos, com propósito

## 📁 Estrutura do repositório

```
windows-dotfiles
│
├── install.ps1
├── README.md
│
├── oh-my-posh
│   ├── base
│   │   └── jandedobbeleer.omp.json   # tema de referência, não usado diretamente
│   └── eclipse.omp.json              # tema em uso
│
├── powershell
│   ├── profile.ps1
│   └── config
│       ├── aliases.ps1
│       ├── functions.ps1
│       ├── modules.ps1
│       └── psreadline.ps1
│
├── terminal
├── git
└── winget
```

## ⚙️ Dependências

| Categoria | Ferramenta |
|---|---|
| Prompt | [Oh My Posh](https://ohmyposh.dev/) |
| Módulo PowerShell | Terminal-Icons |
| Módulo PowerShell | PSReadLine |
| Módulo PowerShell | PSFzf |
| Binário | fzf |
| Navegação | zoxide |
| Listagem | eza |
| Busca em arquivos | ripgrep (`rg`) |
| Busca de arquivos | fd |
| Visualização de arquivo | bat |
| Editor | Neovim |

Todas são instaladas automaticamente pelo `install.ps1`.

## 🚀 Como instalar do zero

### 1. Instalar o Git

```powershell
winget install Git.Git -s winget
```

### 2. Clonar o repositório

```powershell
git clone https://github.com/JonatasTeles/windows-dotfiles.git
```

### 3. Rodar o instalador

```powershell
cd $HOME\projects\windows-dotfiles
.\install.ps1
```

O script cuida de:
- Instalar Oh My Posh, zoxide, eza, ripgrep, fd, bat, Neovim e fzf via `winget`
- Instalar os módulos PowerShell (Terminal-Icons, PSReadLine, PSFzf)
- Escrever o `$PROFILE` apontando para o `profile.ps1` do repositório e para o tema `eclipse.omp.json`

### 4. Recarregar o terminal

```powershell
reload
```

Ou feche e abra o Windows Terminal de novo.

## ✅ Verificando se está tudo certo

```powershell
Test-Path "$HOME\projects\windows-dotfiles\oh-my-posh\eclipse.omp.json"   # deve retornar True
Get-Content $PROFILE                                                      # confere as linhas do profile
```

Se o prompt mostrar **"CONFIG NOT FOUND"** em vez do tema Eclipse, o caminho no `$PROFILE` está errado — normalmente porque o repositório foi clonado em uma pasta diferente da esperada. Corrija manualmente com:

```powershell
notepad $PROFILE
```

## 🔄 Atualizando o profile depois de mudanças no repositório

Se você editar `eclipse.omp.json`, `profile.ps1` ou qualquer arquivo em `config/`, não precisa rodar o `install.ps1` de novo — só recarregar:

```powershell
reload
```

(alias já configurado em `functions.ps1`)

## 🛠️ Aliases e funções disponíveis

| Comando | O que faz |
|---|---|
| `vim` | abre o Neovim (`nvim`) |
| `grep` | busca com ripgrep (`rg`) |
| `find` | busca arquivos com `fd` |
| `cat` | exibe arquivo com `bat` |
| `la` | lista arquivos com `eza` |
| `ll` | lista detalhada com ícones (`eza -lah --icons`) |
| `touch <nome>` | cria um arquivo vazio |
| `mkcd <nome>` | cria uma pasta e já entra nela |
| `reload` | recarrega o `$PROFILE` |

## 📌 Notas

- Os IDs de pacote do `winget` (especialmente `eza` e `zoxide`) podem mudar de nome com o tempo. Se o `install.ps1` falhar em algum pacote, rode `winget search <nome>` para confirmar o ID atual e ajuste o script.
- O `install.ps1` usa `$PSScriptRoot`, então funciona independente da pasta onde o repositório for clonado — não precisa editar caminhos fixos.