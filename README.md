# old_bread

lib/
├── pages/
│   └── book_page.dart
├── widgets/
│   └── book_page/
│       ├── main_menu/
│       │   ├── colors_options/
│       │   │   ├── color_option.dart
│       │   │   ├── dark_sub_options.dart
│       │   │   ├── old_bread_sub_options.dart
│       │   │   └── palette_menu.dart
│       │   ├── font_options/
│       │   │   ├── fonte_livro.dart
│       │   │   └── fonte_palavra.dart
│       │   ├── main_menu_header.dart
│       │   ├── main_menu.dart
│       ├── word_control/
│       │   ├── main_text_widget.dart
│       │   ├── ppm_text_widget.dart
│       │   └── top_word_widget.dart
├── main.dart
└── themeBread.dart


### Descrição das Pastas e Arquivos

**pages/**
- Contém a lógica principal e estado do aplicativo.
  - **`book_page.dart`**: Contém a definição da classe `OldBreadBookState` e os métodos relacionados ao estado e lógica principal do aplicativo.

**widgets/book_page/**
- Contém todos os widgets utilizados na `book_page`, organizados conforme a funcionalidade.

**widgets/book_page/font_options/**
- Contém widgets para configuração de tamanho de fonte do livro e palavra.
  - **`fonte_livro.dart`**: Widget para controlar o tamanho da fonte do livro.
  - **`fonte_palavra.dart`**: Widget para controlar o tamanho da fonte da palavra.

**widgets/book_page/main_menu/**
- Contém o widget principal do menu e suas sub-opções.
  - **`main_menu.dart`**: Widget principal para o menu com várias opções.
  - **`main_menu_header.dart`**: Widget para o cabeçalho do menu principal.
  - **`palette_menu.dart`**: Widget para o sub-menu de paleta de cores.
  - **`color_option.dart`**: Widget para as opções de cor no sub-menu de paleta.

**widgets/book_page/main_menu/colors_options/**
- Contém widgets para sub-opções específicas de cores.
  - **`dark_sub_options.dart`**: Sub-opções para o tema "Dark".
  - **`old_bread_sub_options.dart`**: Sub-opções para o tema "Old Bread".

**widgets/book_page/word_control/**
- Contém widgets relacionados ao controle de palavras.
  - **`main_text_widget.dart`**: Contém o widget para o texto principal com funcionalidade de toque.
  - **`ppm_text_widget.dart`**: Contém o widget para exibir o texto "PPM".
  - **`top_word_widget.dart`**: Contém o widget para exibir a palavra no topo da página.

**Arquivos Individuais**
- **`main.dart`**: Arquivo principal de inicialização do aplicativo.
- **`themeBread.dart`**: Contém definições de temas utilizados no aplicativo.


