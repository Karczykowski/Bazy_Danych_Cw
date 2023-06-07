#include <stdio.h>
#include <stdlib.h>

int wyczysc(char *nap) {
    nap[0] = 0;
    return 0;
}

int dlugosc(char *nap) {
int i=0;
while(nap[i]!=0)
i++;
return i;
}

int porownaj(char *nap1, char *nap2)
{
    int i=0;
    while(nap1[i]!=0)
    {
        if(nap1[i]!=nap2[i])
            return 0;
        i++;
    }
    return 1;
}

int ktoryPierwszy(char *nap1, char *nap2)
{
    int i;
    for(i=0;(nap1[i]!=0)&&(nap2[i]!=0);i++)
    {
        if(nap1[i]!=nap2[i])
            return (nap1[i]<nap2[i])?1:0;
    }

    if(nap1[i]!=0)
        return 0;
    else
        return 1;
}

void przepisz(wchar_t *napis_zrodlo, wchar_t *napis_cel) {
    int i = 0;
    while (napis_zrodlo[i] != 0) {
        napis_cel[i] = napis_zrodlo[i];
        i++;
    }
    napis_cel[i] = 0;
}

char *kopia(char *napis)
{
    int n = dlugosc(napis);
    char *kopia = (char*)malloc((n + 1) * sizeof(char));

    int i;
    for (i=0;i<n;i++) {
        kopia[i]=napis[i];
    }
    kopia[n]=0;

    return kopia;
}

void imie(char *nap)
{
int i=1;
    while(nap[i] != ' ')
    {
        nap[i] += ('a'-'A');
        i++;
    }
    nap[i]='.';
    i+=2;
    while(nap[i] != 0)
    {
        nap[i] += ('a'-'A');
        i++;
    }
}

char *przesun_napis(int nr, char* napis, char znak) {
    int n = dlugosc(napis);
    char* wynik = (char*)malloc((n + 2) * sizeof(char));

    int i, j;
    for (i=0, j=0; i<n; i++, j++) {
        if (i == nr) {
            wynik[j] = 'W';
            j++;
        }
        wynik[j] = napis[i];
    }

    wynik[j]=0;

    return wynik;
}

char *w_AB(char *napis)
{
    int n=dlugosc(napis);
    char* wynik = kopia(napis);
    int i, j;
    for(i=0,j=0;i<n;i++,j++)
    {
        if((napis[i]=='a' && napis[i+1]=='b') || (napis[i]=='b' && napis[i+1]=='a'))
        {
            wynik = przesun_napis(j+1, wynik, 'W');
            j++;
        }
    }
    return wynik;
}

void sklej (char *nap1, char *nap2, char* nap3) {
int i, j;
for(i=0;nap1[i]!=0;i++)
    nap3[i]=nap1[i];

for(j=0;nap2[j]!=0;i++,j++)
    nap3[i]=nap2[j];

nap3[i]=0;
}

int **alokuj (unsigned int n, unsigned int m)
{
    int **t=malloc(n*sizeof(int*));
    int i;
    for(i=0;i<n;i++)
    {
        t[i]=malloc(m*sizeof(int));
    }
    return t;
}

void zwolnij(unsigned int n, unsigned int m, int **t)
{
int i;
for(i=0;i<n;i++)
free(t[i]);
free(t);
}

void wyswietl (int** macierz, int n) {
    int i, j;

    for (i=0;i<n;i++) {
        for (j=0;j<n;j++) {
            printf("%d",macierz[i][j]);
        }
        printf("\n");
    }
}

void wyswietlTab (int m, int n, int tab[m][n])
{
    int i, j;
    for(i=0;i<m;i++)
    {
        for(j=0;j<n;j++)
        {
            printf("%dx%d: %d ", m, n, tab[i][j]);
        }
        printf("\n");
    }
    printf("\n");
}

int** wczytaj_macierz(int n) {
    int** macierz = (int**)malloc(n * sizeof(int*));
    int i, j;

    printf("Wprowadz elementy macierzy:\n");
    for (i=0;i<n;i++) {
        macierz[i]=(int*)malloc(n*sizeof(int));
        for (j =0;j<n;j++) {
            printf("Wiersz %d, Kolumna %d: ",i+1,j+1);
            scanf("%d", &macierz[i][j]);
        }
    }

    return macierz;
}

int slad(int** m, int n) {
    int wynik=0;
    int i;

    for (i=0;i<n;i++)
        wynik+=m[i][i];

    return wynik;
}

int suma_brzegu(int m, int n, int **tab)
{
    int i,j;
    int wynik=0;
    for(i=0;i<m;i++)
    {
        for(j=0;j<n;j++)
        {
            if(i==0 || i==m-1 || j==0 || j==n-1)
            {
                if(tab[i][j]%2==0)
                {
                    wynik+=tab[i][j];
                }
            }
        }
    }
    return wynik;
}

void odwroc_kolumny(int m, int n, int tablica[m][n])
{
    int i, j, temp;
    for(i=0;i<m;i++)
    {
        for(j=0;j<n/2;j++)
        {
            temp=tablica[j][i];
            tablica[j][i]=tablica[m-j-1][i];
            tablica[m-j-1][i]=temp;
        }
    }
}

void przesunPrawo2(int m, int n, int tablica[m][n]) {
    int i, j, temp;

    for (i=0;i<m;i++) {
        for (j=n-1;j>=2;j--) {
            temp=tablica[i][j];
            tablica[i][j]=tablica[i][j-2];
            tablica[i][j-2]=temp;
        }
    }
}

struct trojkat
{
    double a, b, c;
};

union super_int
{
int i;
unsigned int u;
};

struct element
{
int i;
struct element *next;
};

struct element *utworz()
{
return NULL;
}

void wyczyscL(struct element *Lista)
{
    struct element *wsk=Lista;
    while(Lista!=NULL)
    {
        Lista=Lista->next;
        free(wsk);
        wsk=Lista;
    }
}

struct element *dodaj(struct element *Lista, int a)
{
        struct element *wsk=malloc(sizeof(struct element));
        wsk->i=a;
        wsk->next=Lista;
        return wsk;
}

void wyswietlL(struct element* Lista) {
    struct element* wsk =Lista;
    while (wsk!=NULL) {
        printf("%d ",wsk->i);
        wsk = wsk->next;
    }
    printf("\n");
}

struct element* coDrugie(struct element* Lista) {

    struct element* wsk=Lista->next;
    struct element* wynik=Lista;
    struct element* ostatni=Lista;
    int licznik = 1;

    while (wsk!=NULL) {
        if (licznik%2==0) {
            ostatni->next=wsk;
            ostatni=ostatni->next;
        }
        licznik++;
        wsk=wsk->next;
    }

    ostatni->next=NULL;

    return wynik;
}

struct element* usunSrodek(struct element* lista)
{
    int dlugoscListy = 0;
    struct element* aktualny = lista;
    while (aktualny != NULL)
    {
        dlugoscListy++;
        aktualny = aktualny->next;
    }

    int i;
    if (dlugoscListy % 2 == 0)
    {
        struct element* przedSrodkiem = lista;
        for (i = 0; i < dlugoscListy / 2 - 2; i++)
        {
            przedSrodkiem = przedSrodkiem->next;
        }

        struct element* srodek = przedSrodkiem->next;
        przedSrodkiem->next = srodek->next->next;
        srodek->next->next = NULL;
        wyczyscL(srodek);
    }
    else
    {
        struct element* przedSrodkiem = lista;
        for (i = 0; i < dlugoscListy / 2 - 1; i++)
        {
            przedSrodkiem = przedSrodkiem->next;
        }

        struct element* srodek = przedSrodkiem->next;
        przedSrodkiem->next = srodek->next;
        srodek->next = NULL;
        wyczyscL(srodek);
    }

    return lista;
}
int main() {
    /*
    char str[] = "Hello, world!";
    char str2[] = "Bye, world!";

    printf("Before: %s\n", str);
    printf("Dlugosc: %d\n", dlugosc(str));
    printf("Porownanie: %d\n", porownaj(str, str2));
    printf("KtoryPierwszy: %d\n", ktoryPierwszy(str, str2));

    wyczysc(str);

    printf("After: %s\n", str);
    */

    /*
    char str[] = "KAMIL NOWAK";

    printf("Before: %s\n", str);

    imie(str);

    printf("After: %s\n", str);

    char str2[] = "baba";
    printf("W: %s\n", w_AB(str2));
    */


    /*
    int** macierz = wczytaj_macierz(3);
    wyswietl(macierz, 3);

    printf("Slad: %d\n", slad(macierz, 3));
    printf("Suma brzegow: %d\n", suma_brzegu(3,3,macierz));

    wyswietl(macierz, 3);

    zwolnij(3,3,macierz);
    */

    /*
    int tabs[4][4] = {
        {1, 2, 3, 1},
        {4, 5, 6, 1},
        {7, 8, 9, 1},
        {2, 2, 2, 2}
    };
    wyswietlTab(4,4,tabs);
    przesunPrawo2(4,4,tabs);
    wyswietlTab(4,4,tabs);
    */

    struct element* Lista = utworz();

    Lista = dodaj(Lista, 1);
    Lista = dodaj(Lista, 5);
    Lista = dodaj(Lista, 8);
    Lista = dodaj(Lista, 7);
    Lista = dodaj(Lista, 2);
    Lista = dodaj(Lista, 2);

    wyswietlL(Lista);

    Lista=usunSrodek(Lista);

    wyswietlL(Lista);
    wyczyscL(Lista);

    return 0;
}
