#define VIDEO_MEMORY 0xB8000
#define WHITE_ON_BLUE 0x1F
#define SCREEN_WIDTH 80
#define SCREEN_HEIGHT 25

void clear_screen() {
    char* vidmem = (char*)VIDEO_MEMORY;
    for (int i = 0; i < SCREEN_WIDTH * SCREEN_HEIGHT * 2; i += 2) {
        vidmem[i] = ' ';
        vidmem[i+1] = WHITE_ON_BLUE;
    }
}

void print_centered(int y, const char* str) {
    char* vidmem = (char*)VIDEO_MEMORY;
    int len = 0;
    const char* tmp = str;

    while (*tmp++) len++;
    
    int offset = (y * SCREEN_WIDTH * 2) + ((SCREEN_WIDTH - len) * 2) / 2;
    while (*str) {
        vidmem[offset++] = *str++;
        vidmem[offset++] = WHITE_ON_BLUE;
    }
}

void kernel_main() {
    clear_screen();

    print_centered(10, "Welcome to KIAC-T!");
    print_centered(12, "Heh, its just test of kernel,");
    print_centered(13, "here's no functions, lol");
    print_centered(15, "But, if you see this text then kernel working!");
    
    while(1);
}