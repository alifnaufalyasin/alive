program tubes1;           
uses crt;
const nMax = 100;
type administrator = record
        nama : string;
        username : string;
        password : string;
        Nadm : integer;
        end;
type bukulelang = record
        judul : string;
        jumlah : integer;
        peminat : integer;
        kateg : char; {1:science, 2:history, 3:comic, 4:universal}
        end;
type penjual = record
        nama : string;
        alamat : string;
        notelp : string;
        buku : array[1..nMax] of bukulelang;
        Nusr : integer;
        Nbuku : integer;
        end;
        //user[1].Nusr itu banyaknya user
        //user[2].Nusr itu id user saat login, jadi id di menu usernya
        //user[3].Nusr itu banyaknya pindahan buku sebelum di sort
type pengguna = array[1..nMax] of penjual;
type penyedia = array[1..nMax] of administrator;
type tempbuku = record
        peminat : integer; 
        judul : string;
        kodeuser : integer;
        kodebuku : integer;
        end;
type sementara = array [1..nMax] of tempbuku;


var
    user : pengguna;
    admin : penyedia;
    

    procedure viewlist(user:pengguna);
    {IS. tersedia array user sebanyak user[1].Nusr yang sudah terisi
    FS. Menampilkan semua buku di semua user}
    var
        i,a,j : integer;
    begin
        a :=0;
        clrscr;
        i := 1;
        while i <= user[1].Nusr do{user ke-...}
            begin
                j := 1;
                while j <= user[i].Nbuku do{Buku ke-...}
                    begin
                        if (a mod 4=0) and (a<>0) then
                            begin
                                write('enter to next >>>>>');
                                readln;
                                clrscr;
                            end;
                        write('Kode Buku : ');
                        writeln(i,'.',j);
                        Write('Judul : ');
                        writeln(user[i].buku[j].judul);
                        write('Jumlah : ');
                        if user[i].buku[j].jumlah = 0 then
                            writeln('Habis')
                        else 
                            writeln(user[i].buku[j].jumlah);
                        write('Kategori : ');
                        case user[i].buku[j].kateg of
                            '1':writeln('Science');
                            '2':writeln('History');
                            '3':writeln('Comic');
                        end;
                        write('Peminat : ');
                        writeln(user[i].buku[j].peminat);
                        j:= j + 1;
                        a:= a + 1;
                        writeln;
                    end;
                i := i + 1;
            end;
        write('Enter untuk kembali...');
        readln;
    end;

    procedure liatbuku(user : pengguna);
    {IS. tersedia array user sebanyak user[1].Nusr yang sudah terisi
    FS. Menampilkan semua buku pada 1 user yang login}
    var
        i,a : integer;
    begin
        clrscr;
        a:=0;
        i := 1;
        while i <= user[user[2].Nusr].Nbuku do
            begin
            if (a mod 4=0) and (a<>0) then
                begin
                    write('enter to next >>>>>');
                    readln;
                    clrscr;
                end;
            writeln('Buku ke-',i);
            Write('Judul : ');
            writeln(user[user[2].Nusr].buku[i].judul);
            write('Jumlah : ');
            writeln(user[user[2].Nusr].buku[i].jumlah);
            write('Kategori : ');
            case user[user[2].Nusr].buku[i].kateg of
                '1':writeln('Science');
                '2':writeln('History');
                '3':writeln('Comic');
            end;
            write('Peminat : ');
            writeln(user[user[2].Nusr].buku[i].peminat);
            i:= i + 1;
            a:=a+1;
            writeln;
            end;
        write('Enter to exit..');
        readln;
    end;
    
    procedure tampilsortkateg(user:pengguna; pil:char);
    {IS. tersedia array user sebanyak user[1].Nusr yang sudah terisi
    FS. menampilkan isi array user yang sudah terurut berdasarkan kategori}
    var
        i,j,ada : integer;
    begin
        clrscr;
        ada := 0;
        i := 1;
        while i <= user[1].Nusr do{user ke-...}
            begin
                j := 1;
                while j <= user[i].Nbuku do{Buku ke-...}
                    begin
                        if (user[i].buku[j].kateg = pil) and (pil<>'4') then
                            begin
                                if (ada mod 4=0) and (ada<>0) then
                                    begin
                                        write('enter to next >>>>>');
                                        readln;
                                        clrscr;
                                    end;
                                ada := ada + 1;
                                write('Kode Buku : ');
                                writeln(i,'.',j);
                                Write('Judul : ');
                                writeln(user[i].buku[j].judul);
                                write('Jumlah : ');
                                writeln(user[i].buku[j].jumlah);
                                write('Kategori : ');
                                case user[i].buku[j].kateg of
                                    '1':writeln('Science');
                                    '2':writeln('History');
                                    '3':writeln('Comic');
                                    end;
                                write('Peminat : ');
                                writeln(user[i].buku[j].peminat);
                                writeln;
                            end
                        else if pil = '4' then
                            begin
                                if (ada mod 4=0) and (ada<>0) then
                                    begin
                                        write('enter to next >>>>>');
                                        readln;
                                        clrscr;
                                    end;
                                ada := ada + 1;
                                write('Kode Buku : ');
                                writeln(i,'.',j);
                                Write('Judul : ');
                                writeln(user[i].buku[j].judul);
                                write('Jumlah : ');
                                writeln(user[i].buku[j].jumlah);
                                write('Kategori : ');
                                case user[i].buku[j].kateg of
                                    '1':writeln('Science');
                                    '2':writeln('History');
                                    '3':writeln('Comic');
                                    end;
                                write('Peminat : ');
                                writeln(user[i].buku[j].peminat);
                                writeln;
                            end;
                        j:= j + 1;
                    end;
                i := i + 1;
            end;
        if (ada = 0) and ((pil = '1') or (pil = '2') or (pil = '3') or (pil = '4')) then
            writeln('Tidak ada buku')
        else
            writeln('Pilihan kategori salah');
        write('Enter untuk kembali...');
        readln;
    end;

    procedure caribuku(user:pengguna);
    {IS. tersedia array user sebanyak user[1].Nusr yang sudah terisi
    FS. menampilkan data user yang dicari}
    var
        cari : string;
        i,j,ada : integer;
    begin
        clrscr;
        writeln('====================================');
        writeln;
        write('Masukkan Judul buku : ');
        readln(cari);
        writeln('====================================');
        i := 1;
        ada := 0;
        while i <= user[1].Nusr do{user ke-...}
            begin
                j := 1;
                while j <= user[i].Nbuku do{Buku ke-...}
                    begin
                        if cari = user[i].buku[j].judul then
                            begin
                                write('Kode Buku : ');
                                writeln(i,'.',j);
                                Write('Judul : ');
                                writeln(user[i].buku[j].judul);
                                write('Jumlah : ');
                                if user[i].buku[j].jumlah = 0 then
                                    writeln('Habis')
                                else 
                                    writeln(user[i].buku[j].jumlah);
                                write('Kategori : ');
                                case user[i].buku[j].kateg of
                                    '1':writeln('Science');
                                    '2':writeln('History');
                                    '3':writeln('Comic');
                                end;
                                write('Peminat : ');
                                writeln(user[i].buku[j].peminat);
                                j:= j + 1;
                                ada := ada + 1;
                                writeln;
                            end
                        else
                            j:= j + 1;
                    end;
                i := i + 1;
            end;
        if ada = 0 then
            writeln('Buku yang dicari tidak ada')
        else
            Writeln('enter untuk kembali ke menu');
        readln;
    end;

    procedure pindahisi(var user:pengguna; var tempArr:sementara);
    {IS. tersedia array user sebanyak user[1].Nusr yang sudah terisi
    FS. aray tempArr terisi dari data array user sebanyak user[3].Nusr, data sesuai kebutuhan untuk sorting}
    var
        i,j : integer;
    begin
        user[3].Nusr := 0;
        for i:= 1 to user[1].Nusr do
        begin
            if i = 1 then
                j := 0
            else
                j := 1;
            while (j <= user[i].Nbuku) do
            begin
                tempArr[user[3].Nusr].peminat := user[i].buku[j].peminat;
                tempArr[user[3].Nusr].judul := user[i].buku[j].judul;
                tempArr[user[3].Nusr].kodeuser := i;
                tempArr[user[3].Nusr].kodebuku := j;
                user[3].Nusr := user[3].Nusr + 1;  //ini buat ngitung berapa banyak data buku dari semua user.
                j := j + 1;
            end;
        end;
    end;

    procedure viewsort(user:pengguna; tempArr:sementara);
    {IS. tersedia array user sebanyak user[1].Nusr dan array tempArr sebanyak user[3].Nusr
    FS. menampilkan data yang sudah terurut}
    var
        a,i : integer;
    begin
        a := 0;
        clrscr;
        if user[3].Nusr <> 0 then
            begin
                for i:=1 to user[3].Nusr-1 do
                begin
                    if (a mod 4=0) and (a<>0) then
                        begin
                            write('enter to next >>>>>');
                            readln;
                            clrscr;
                        end;
                    write('Kode Toko : ');
                    writeln(tempArr[i].kodeuser,'.',tempArr[i].kodebuku);
                    write('Nama Penjual : ');
                    writeln(user[tempArr[i].kodeuser].nama);
                    write('Judul buku : ');
                    writeln(user[tempArr[i].kodeuser].buku[tempArr[i].kodebuku].judul);
                    write('Jumlah buku : ');
                    writeln(user[tempArr[i].kodeuser].buku[tempArr[i].kodebuku].jumlah);
                    write('Kategori : ');
                    case user[tempArr[i].kodeuser].buku[tempArr[i].kodebuku].kateg of
                        '1':writeln('Science');
                        '2':writeln('History');
                        '3':writeln('Comic');
                    end;
                    write('Peminat : ');
                    writeln(user[tempArr[i].kodeuser].buku[tempArr[i].kodebuku].peminat);
                    writeln;
                    a := a + 1;
                end;
            end
        else
            writeln('Maaf, Belum ada buku yang tersedia');          
        write('Enter untuk kembali...');
        readln;
    end;

    procedure sortjudul(user:pengguna; var tempArr:sementara);
    {IS. tersedia array user sebanyak user[1].Nusr dan array tempArr sebanyak user[3].Nusr
    FS. array sudah terurut berdasarkan judul}
    var
        temp : tempbuku;
        i,pass : integer;
        pil : char;
    begin
        writeln('(1). A-Z ');
        writeln('(2). Z-A ');
        write('Pilihan : ');
        readln(pil);
        if pil = '2' then
            begin
                pass := 1;
                while pass <= user[3].Nusr-1 do
                    begin
                        i := pass + 1;
                        temp := tempArr[i];
                        while (i > 1) and (temp.judul > tempArr[i-1].judul) do
                            begin
                                tempArr[i] := tempArr[i-1];
                                i := i - 1;
                            end;
                        tempArr[i] := temp;
                        pass := pass + 1;
                    end;
            end
        else if pil = '1' then
            begin
                pass := 1;
                while pass <= user[3].Nusr-1 do
                    begin
                        i := pass;
                        temp := tempArr[i];
                        while (i > 1) and (temp.judul < tempArr[i-1].judul) do
                            begin
                                tempArr[i] := tempArr[i-1];
                                i := i - 1;
                            end;
                        tempArr[i] := temp;
                        pass := pass + 1;
                    end;
            end;
    end;

    procedure sortpeminat(user:pengguna; var tempArr:sementara);
    {IS. tersedia array user sebanyak user[1].Nusr dan array tempArr sebanyak user[3].Nusr
    FS. array sudah terurut berdasarkan banyaknya peminat}
    var
        i,pass,idx : integer;  
        baskom : tempbuku;
    begin
        pass := 1;
        while pass <= user[3].Nusr-1 do
            begin
                idx := pass;
                i := pass + 1;
                while i <= user[3].Nusr-1 do
                begin
                    if tempArr[idx].peminat < tempArr[i].peminat then
                        idx := i;
                    i := i + 1;
                end;
                baskom := tempArr[pass];
                tempArr[pass] := tempArr[idx];
                tempArr[idx] := baskom;
                pass := pass + 1;
            end;
    end;

    procedure tampilsortjudul(user:pengguna);
    {IS. tersedia array user sebanyak user[1].Nusr
    FS. menampilkan array sudah terurut berdasarkan judul}
    var
        temp : sementara;
    begin
        pindahisi(user,temp);
        sortjudul(user,temp);
        viewsort(user,temp);
    end;

    procedure tampilsortpeminat(user:pengguna);
    {IS. tersedia array user sebanyak user[1].Nusr
    FS. menampilkan array sudah terurut berdasarkan peminat}
    var
        temp : sementara;
    begin
        pindahisi(user,temp);
        sortpeminat(user,temp);
        viewsort(user,temp);
    end;

    procedure sortingkateg(user:pengguna; var pil:char);
    begin
        clrscr;
        writeln('====================================');
        writeln('     Pilih kategori buku     ');
        writeln('    yang ingin ditampilkan   ');
        writeln;
        writeln('   1. Science ');
        writeln('   2. History ');
        writeln('   3. Comic');
        writeln('   4. Universal');
        writeln;
        writeln('====================================');
        write('Pilihan : ');
        readln(pil);
        tampilsortkateg(user,pil);
    end;
    procedure tambahbuku(var user:pengguna);
    {IS. tersedia array user sebanyak user[1].Nusr
    FS. menambahkan data buku}
    var
        selesai : boolean;
        pil : char;
    begin
        clrscr;
        writeln('====================================');
        writeln('     Masukkan data buku      ');
        writeln;
        write('Judul buku : ');
        readln(user[user[2].Nusr].buku[user[user[2].Nusr].Nbuku].judul);
        write('Jumlah buku : ');
        readln(user[user[2].Nusr].buku[user[user[2].Nusr].Nbuku].jumlah);
        selesai := true;
        while selesai do
            begin
            Writeln('Kategori (1:science, 2:history, 3:comic)');
            write('Pilihan : ');
            readln(pil);
            if (pil = '1') or (pil = '2') or (pil = '3') then
                selesai := false;
            end;
        user[user[2].Nusr].buku[user[user[2].Nusr].Nbuku].kateg := pil;
        Write('Buku ke-',user[user[2].Nusr].Nbuku,' berhasil didaftarkan, enter untuk kembali');
        readln;
    end;

    procedure editbukuadm(var user:pengguna);
    {IS. tersedia array user sebanyak user[1].Nusr
    FS. terubah data buku oleh admin}
    var
        nobuku : string;
        kodeusr,kodebuku : integer;
    begin
        clrscr;
        writeln('====================================');
        writeln('           Edit Buku         ');
        writeln;
        writeln('Masukkan Kode Buku : ');
        readln(nobuku);
        val(nobuku[1],kodeusr);
        val(nobuku[3],kodebuku);
        writeln('Judul sebelum : ',user[kodeusr].buku[kodebuku].judul);
        Write('Judul : ');
        readln(user[kodeusr].buku[kodebuku].judul);
        writeln('Jumlah sebelum : ',user[user[2].Nusr].buku[kodebuku].jumlah);
        write('Jumlah : ');
        readln(user[kodeusr].buku[kodebuku].jumlah);
        write('Kategori sebelum : ');
        case user[kodeusr].buku[kodebuku].kateg of
                '1':writeln('Science');
                '2':writeln('History');
                '3':writeln('Comic');
            end;
        Writeln('Kategori (1:science, 2:history, 3:comic)');
        write('Pilihan : ');
        readln(user[kodeusr].buku[kodebuku].kateg);
        writeln;
        writeln('====================================');
        write('Buku Berhasil diubah, enter untuk kembali...');
        readln;        
    end;

    procedure editbuku(var user:pengguna);
    {IS. tersedia array user sebanyak user[1].Nusr
    FS. terubah data buku oleh user}
    var
        nobuku : integer;
    begin
        clrscr;
        writeln('====================================');
        writeln('           Edit Buku         ');
        writeln;
        writeln('Masukkan No Buku : ');
        readln(nobuku);
        writeln('Judul sebelum : ',user[user[2].Nusr].buku[nobuku].judul);
        Write('Judul : ');
        readln(user[user[2].Nusr].buku[nobuku].judul);
        writeln('Jumlah sebelum : ',user[user[2].Nusr].buku[nobuku].jumlah);
        write('Jumlah : ');
        readln(user[user[2].Nusr].buku[nobuku].jumlah);
        write('Kategori sebelum : ');
        case user[user[2].Nusr].buku[nobuku].kateg of
                '1':writeln('Science');
                '2':writeln('History');
                '3':writeln('Comic');
            end;
        Writeln('Kategori (1:science, 2:history, 3:comic)');
        write('Pilihan : ');
        readln(user[user[2].Nusr].buku[nobuku].kateg);
        writeln;
        writeln('====================================');
        write('Buku Berhasil diubah, enter untuk kembali...');
        readln;        
    end;

    procedure hapusbukuadm(var user:pengguna);
    {IS. tersedia array user sebanyak user[1].Nusr
    FS. terhapus data buku oleh admin}
    var
        nobuku : string;
        kodeusr,kodebuku : integer;
        pil : char;
    begin
        clrscr;
        writeln('====================================');
        writeln('          Hapus Buku         ');
        writeln;
        writeln('Masukkan Kode Buku : ');
        readln(nobuku);
        val(nobuku[1],kodeusr);
        val(nobuku[3],kodebuku);
        writeln('Judul : ',user[kodeusr].buku[kodebuku].judul);
        writeln('Jumlah : ',user[kodeusr].buku[kodebuku].jumlah);
        write('Kategori : ');
        case user[kodeusr].buku[kodebuku].kateg of
                '1':writeln('Science');
                '2':writeln('History');
                '3':writeln('Comic');
            end;
        if (user[kodeusr].buku[kodebuku].judul <> '') then
            begin
                if (user[kodeusr].buku[kodebuku+1].jumlah > 0) or (user[kodeusr].buku[kodebuku+1].peminat > 0) then
                    begin
                        write('Hapus data ? (Y/N) : ');
                        readln(pil);
                        if pil = 'Y' then
                            begin
                            user[kodeusr].buku[kodebuku] := user[kodeusr].buku[kodebuku+1];
                            user[kodeusr].Nbuku := user[kodeusr].Nbuku - 1;
                            writeln;
                            writeln('Buku berhasil dihapus');
                            end;
                    end
                else
                    write('Hapus data ? (Y/N) : ');
                    readln(pil);
                    if pil = 'Y' then
                        begin
                        user[kodeusr].Nbuku := user[kodebuku].Nbuku - 1;
                        writeln;
                        writeln('Buku berhasil dihapus');
                        end; 
            end
        else
            writeln('Tidak ada buku yang terdaftar');
        Writeln('enter untuk kembali ke menu');
        readln;
    end;

    procedure hapusbuku(var user:pengguna);
    {IS. tersedia array user sebanyak user[1].Nusr
    FS. terhapus data buku oleh user}
    var
        nobuku,i : integer;
        pil : char;
    begin
        clrscr;
        writeln('====================================');
        writeln('          Hapus Buku         ');
        writeln;
        write('Masukkan No Buku : ');
        readln(nobuku);
        writeln('Judul : ',user[user[2].Nusr].buku[nobuku].judul);
        writeln('Jumlah : ',user[user[2].Nusr].buku[nobuku].jumlah);
        write('Kategori : ');
        case user[user[2].Nusr].buku[nobuku].kateg of
                '1':writeln('Science');
                '2':writeln('History');
                '3':writeln('Comic');
            end;
        writeln;
        if (user[user[2].Nusr].buku[nobuku].judul <> '') then //ngecek apakah terdapat buku di nobuku yang di input user
            begin
                if (user[user[2].Nusr].buku[nobuku+1].jumlah > 0) or (user[user[2].Nusr].buku[nobuku+1].peminat > 0) then //untuk ngecek apakah buku ini terletak di akhir data atau tengah data
                    begin
                        write('Hapus data ? (Y/N) : ');
                        readln(pil);
                        if pil = 'Y' then
                            begin
                            i := nobuku;
                            while i <= user[user[2].Nusr].Nbuku do
                                begin
                                    user[user[2].Nusr].buku[i] := user[user[2].Nusr].buku[i+1];
                                    i := i +1;
                                end;
                            user[user[2].Nusr].Nbuku := user[user[2].Nusr].Nbuku - 1;
                            writeln;
                            writeln('Buku berhasil dihapus');
                            end;
                    end
                else
                    write('Hapus data ? (Y/N) : ');
                    readln(pil);
                    if pil = 'Y' then
                        begin
                        user[user[2].Nusr].Nbuku := user[user[2].Nusr].Nbuku - 1;
                        writeln;
                        writeln('Buku berhasil dihapus');
                        end; 
            end
        else
            writeln('Tidak ada buku yang terdaftar');
        Writeln('enter untuk kembali ke menu');
        readln;
    end;

    procedure menuuser(var user:pengguna);
    var
        jawabanuser : char;
        status : boolean;
    begin
        status := true;
        while status do
        begin
            clrscr;
            writeln('Menu User >> Penjual');
            writeln('====================================');
            writeln('       Hai,',user[user[2].Nusr].nama,'...'); // user[2].Nuser adalah id user di menunya.
            writeln;
            writeln;
            writeln('   1. List Buku saya       ');
            writeln('   2. Tambah Daftar Buku     ');
            writeln('   3. Edit Buku              ');
            writeln('   4. Hapus Buku');
            writeln;
            writeln;
            writeln('               0 : Exit      ');
            writeln('====================================');
            readln(jawabanuser);
            case jawabanuser of
                '1':liatbuku(user);
                '2':begin
                        user[user[2].Nusr].Nbuku := user[user[2].Nusr].Nbuku + 1; // tiap user nambah buku, maka jumlah bukunya bertambah
                        tambahbuku(user); 
                    end;
                '3':begin
                        liatbuku(user);
                        editbuku(user);
                    end;
                '4':begin
                        liatbuku(user);
                        hapusbuku(user);
                    end;
                '0':status := false;
            end;
        end;
    end;

    procedure loginuser(var user:pengguna);
    var
        status : boolean;
        namausr : string;
        jawabanuser : char;
        percobaan : integer;
    begin
        percobaan := 3;
        status := True;
        while status do
        begin
            clrscr;
            writeln('====================================');
            writeln;
            write('nama : ');
            readln(namausr);
            writeln;
            writeln('====================================');
            user[2].Nusr := 1;
            while (user[2].Nusr <= user[1].Nusr) and (namausr <> user[user[2].Nusr].nama) do
                user[2].Nusr := user[2].Nusr + 1;
            if namausr = '' then
                begin
                percobaan := percobaan - 1;
                writeln('nama yang anda masukkan salah');
                writeln('    silahkan coba lagi...');
                writeln;
                writeln('  Kesempatan : ',percobaan);
                readln(jawabanuser);
                if percobaan = 0 then
                    status := false;
                end
            else if namausr = user[user[2].Nusr].nama then
                begin
                menuuser(user);
                status := false;
                end
            else
                begin
                percobaan := percobaan - 1;
                writeln('nama yang anda masukkan salah');
                writeln('    silahkan coba lagi...');
                writeln;
                writeln('  Kesempatan : ',percobaan);
                readln(jawabanuser);
                if percobaan = 0 then
                    status := false;
                end
        end;
    end;

    procedure progbeli(var user:pengguna);
    var
        kode,keterangan : string;
        jumlah,nouser,nobuku : integer;
        status : boolean;
        
    begin
        status := true;
        keterangan := 'Masukkan Data';
        while status do
            begin
                clrscr;
                writeln('Menu User >> Pembeli >> Beli');
                writeln('====================================');
                writeln('   ',keterangan);
                writeln;
                write('Kode Buku : ');
                readln(kode);
                write('Jumlah buku : ');
                readln(jumlah);
                val(kode[1],nouser);
                val(kode[3],nobuku);
                if (nouser>user[1].Nusr) or (nobuku>user[nouser].Nbuku) then
                        keterangan := 'Kode Buku salah'
                else if user[nouser].buku[nobuku].jumlah = 0 then
                        keterangan := 'Buku yang dipilih habis'
                else if jumlah > user[nouser].buku[nobuku].jumlah then
                        keterangan := 'Jumlah buku tidak sesuai'
                else
                    begin
                        user[nouser].buku[nobuku].jumlah := user[nouser].buku[nobuku].jumlah - jumlah;
                        user[nouser].buku[nobuku].peminat := user[nouser].buku[nobuku].peminat + jumlah;
                        writeln('Buku Berhasil dibeli');
                        readln;
                        status := false;
                    end;              
            end;                
    end;

    procedure regisuser(var user:pengguna);
    var
        status : boolean;
        i : integer;
        keterangan,namausr : string;
    begin
        clrscr;
        status := true;
        keterangan := 'masukkan data';
        while status do 
            begin
                clrscr;
                writeln('Menu User >> Menu Login >> Register');
                writeln('====================================');
                writeln(keterangan);
                writeln;
                write('Nama : ');
                readln(namausr);
                i := 1;
                while (i <= user[1].Nusr) and (namausr <> user[i].nama) do 
                    i := i + 1;
                if namausr = '' then
                    keterangan := 'masukkan data dengan benar'
                else if namausr <> user[i].nama then
                    begin
                    status := false;
                    keterangan := 'masukkan data'
                    end
                else
                    keterangan := 'nama sudah ada yang menggunakan, coba lagi';
            end;
        user[user[1].Nusr].nama := namausr;
        clrscr;
        writeln('====================================');
        writeln(keterangan);
        writeln;
        write('Nama : ');
        writeln(user[user[1].Nusr].nama);
        write('Alamat : ');
        readln(user[user[1].Nusr].alamat);
        write('No Telp : ');
        readln(user[user[1].Nusr].notelp);
        writeln;
        writeln('====================================');
        write('Data tersimpan, enter to menu');
    end;

    procedure menupenjual(var user:pengguna);
    var
        jawabanuser : char;
        status : boolean;
    begin
        status := true;
        while status do
            begin
                clrscr;
                writeln('Menu User >> Menu Login');
                writeln('====================================');
                writeln;
                writeln;
                writeln('   1. Log in                  ');
                writeln('   2. Register                ');
                writeln;
                writeln;
                writeln('                     0 : exit');
                writeln('====================================');
                write('Pilihan : ');
                readln(jawabanuser);
                if jawabanuser='1' then
                    loginuser(user)
                else if jawabanuser='2' then
                    begin
                        user[1].Nusr := user[1].Nusr + 1;
                        user[user[1].Nusr].Nbuku := 0;
                        user[user[1].Nusr].buku[user[user[1].Nusr].Nbuku].peminat := 0;
                        regisuser(user); 
                    end
                else if jawabanuser = '0' then
                    status := false;
            end;
    end;

    procedure menupembeli(var user:pengguna);
    var
        jawabanuser : char;
        status : boolean;
    begin
        status := true;
        while status do
            begin
                clrscr;
                writeln('Menu User >> Pembeli');
                writeln('====================================');
                writeln;
                writeln('   1. Lihat Semua buku       ');
                writeln('   2. Sort Kategori          ');
                writeln('   3. Sort Judul Buku');
                writeln('   4. Sort Peminat          ');
                writeln('   5. Cari Buku ');
                writeln('   6. Beli Buku');
                writeln;
                writeln('                   0 : Exit ');
                writeln('====================================');
                write('Pilihan : ');
                readln(jawabanuser);
                case jawabanuser of
                        '1':viewlist(user);
                        '2':sortingkateg(user,jawabanuser);
                        '3':tampilsortjudul(user);
                        '4':tampilsortpeminat(user);
                        '5':caribuku(user);
                        '6':begin
                            viewlist(user);
                            progbeli(user);
                            end;
                        '0':status := false;
                    end;
            end;
    end;

    procedure pilihanuser(var user:pengguna);
    var
        jawabanuser : char;
        status : boolean;
    begin
        status := true;
        while status do
            begin
                clrscr;
                writeln('Menu User// ');
                writeln('====================================');
                writeln;
                writeln;
                writeln('   1. Penjual                ');
                writeln('   2. Pembeli                ');
                writeln;
                writeln;
                writeln('                     0 : exit');
                writeln('====================================');
                write('Pilihan : ');
                readln(jawabanuser);
                if jawabanuser = '1' then
                    menupenjual(user)
                else if jawabanuser = '2' then
                    menupembeli(user)
                else if jawabanuser = '0' then
                    status := false;
            end; 
    end;

    procedure hapususer(var user:pengguna);
    var
        cari : string; 
        i : integer;   
    begin
        writeln('====================================');
        writeln;
        writeln('masukkan nama user yang ingin di hapus : ');
        write('Nama : ');
        readln(cari);
        i := 1;
        while (i <= user[1].Nusr) and (cari <> user[i].nama) do
            i := i + 1;
        if cari = user[i].nama then
            begin
            if (i < user[1].Nusr) then
                begin
                    while i <= user[1].Nusr do
                        begin
                            user[i] := user[i+1];
                            i := i + 1;
                        end;
                    user[1].Nusr := user[1].Nusr - 1;
                end
            else                   
                user[1].Nusr := user[1].Nusr - 1;
            end
        else
            writeln('Data Tidak Ada');
        write('Enter untuk kembali...');
        readln;
    end;

    procedure edituser(var user:pengguna);
    var
        i : integer;
        cari : string;
    begin
        writeln('====================================');
        writeln;
        writeln('masukkan nama user yang ingin di edit : ');
        write('Nama : ');
        readln(cari);
        i := 1;
        while (i <= user[1].Nusr) and (cari <> user[i].nama) do
            i := i + 1;
        if cari = user[i].nama then
            begin
                user[user[1].Nusr].nama := cari;
                write('Alamat : ');
                readln(user[user[1].Nusr].alamat);
                write('No Telp : ');
                readln(user[user[1].Nusr].notelp);
                writeln;
                writeln('====================================');
            end
        else
            writeln('Data Tidak Ada');
        write('Enter untuk kembali...');
        readln;
    end;

    procedure viewuser(user:pengguna);
    var
        i : integer;
    begin
        i := 1;
        clrscr;
        writeln('====================================');
        writeln;
        while i <= user[1].Nusr do
            begin
                if (i mod 5=0) and (i<>0) then
                    begin
                        writeln('====================================');
                        write('enter to next >>>>>');
                        readln;
                        clrscr;
                    end;
                writeln('User Ke-',i);
                write('Nama : ');
                writeln(user[i].nama);
                write('Alamat : ');
                writeln(user[i].alamat);
                write('No Telp : ');
                writeln(user[i].notelp);
                writeln;
                i:=i+1;
            end;
        writeln('Enter untuk kembali...');
        readln;
    end;

    procedure cariuser(user:pengguna);
    var 
        i : integer;
        cari : string;
    begin
        clrscr;
        writeln('====================================');
        writeln;
        writeln('Masukkan Nama User yang dicari'); 
        write(' : ');
        readln(cari);
        i := 1;
        
        while (i <= user[1].Nusr) and (cari <> user[i].nama) do
            i := i + 1;
        if cari = user[i].nama then
            begin
                writeln('User Ke-',i);
                write('Nama : ');
                writeln(user[i].nama);
                write('Alamat : ');
                Writeln(user[i].alamat);
                write('No Telp : ');
                writeln(user[i].notelp);
            end
        else 
            Writeln('User tidak ditemukan');
        writeln('Enter untuk kembali...');
        readln;


    end;

    procedure menuadminuser(var user:pengguna);
    var
        jawabanuser : char;
        status : boolean;
    begin
        status := true;
        while status do
            begin
                clrscr;
                writeln('Menu Admin >> Pengaturan User');
                writeln('====================================');
                writeln;
                writeln('   1. Liat User                ');
                writeln('   2. Cari User              ');
                writeln('   3. Edit User  ');
                writeln('   4. Hapus User       ');
                writeln('   5. Tambah User');
                writeln;
                writeln('                     0.Exit');
                writeln('====================================');
                write('Pilihan : ');
                readln(jawabanuser);
                case jawabanuser of
                    '1':viewuser(user);
                    '2':cariuser(user);
                    '3':edituser(user);
                    '4':hapususer(user);
                    '5': begin
                            user[1].Nusr := user[1].Nusr + 1;
                            user[user[1].Nusr].Nbuku := 0;
                            user[user[1].Nusr].buku[user[user[1].Nusr].Nbuku].peminat := 0;
                            regisuser(user);
                            end;
                    '0':status:=false;
                    end;
            end;
    end;

    procedure menuadminbuku(var user:pengguna);
    var 
        jawabanuser : char;
        status : boolean;
    begin
        status := true;
        while status do
            begin
                clrscr;
                writeln('Menu Admin >> Pengaturan Buku');
                writeln('====================================');
                writeln;
                writeln('   1. Liat Semua Buku');
                writeln('   2. Cari Buku');
                writeln('   3. Edit Buku');
                writeln('   4. Hapus Buku');
                writeln('   5. Sort Peminat buku');
                writeln;
                writeln('                   0.Exit');
                writeln('====================================');
                write('Pilihan : ');
                readln(jawabanuser);
                case jawabanuser of
                    '1':viewlist(user);
                    '2':caribuku(user);
                    '3':editbukuadm(user);
                    '4':hapusbukuadm(user); 
                    '5':tampilsortpeminat(user);
                    '0':status := false;
                    end;
            end;
    end;

    procedure menuadmin(var admin:penyedia; var user:pengguna);
    var
        jawabanuser : char;
        status : boolean;
    begin
        status := true;
        while status do
            begin
                clrscr;
                writeln('Menu Admin// ');
                writeln('====================================');
                writeln('       Hai,',admin[admin[2].Nadm].username,'...');
                writeln;
                writeln('   1. Pengaturan User');
                writeln('   2. Pengaturan Buku');
                writeln;
                writeln;
                writeln('                     0 : exit');
                writeln('====================================');
                write('Pilihan : ');
                readln(jawabanuser);
                case jawabanuser of
                    '1':menuadminuser(user);
                    '2':menuadminbuku(user);
                    '0':status := false;
                   end;
            end;
    end;

    procedure loginadmin(var admin:penyedia; var user:pengguna);
    {IS. terdefinisi parameter penyedia yaitu array berisi data admin
    FS. mengembalikan data array ke prosedur lain}
    var
        usernama, katasandi : string;
        status : boolean;
        jawabanuser : char;
        percobaan : integer;
    begin
        clrscr;
        status := True;
        percobaan := 3;
        while status do
        begin
            clrscr;
            writeln('====================================');
            writeln;
            writeln;
            write('username : ');
            readln(usernama);
            write('password : ');
            readln(katasandi);
            writeln;
            writeln;
            writeln('====================================');
            admin[2].Nadm := 1;
            while (admin[2].Nadm <= admin[1].Nadm) and (usernama <> admin[admin[2].Nadm].username) do
                admin[2].Nadm := admin[2].Nadm + 1;
            if (usernama = '') or (katasandi = '') then
                begin
                percobaan := percobaan -1;
                writeln('username atau password yang anda masukkan salah');
                writeln('              silahkan coba lagi...');
                writeln;
                writeln('                    Kesempatan : ',percobaan);
                readln(jawabanuser);
                if percobaan = 0 then
                    status := false;
                end
            else if (usernama = admin[admin[2].Nadm].username) and (katasandi = admin[admin[2].Nadm].password) then
                begin
                menuadmin(admin,user);
                status := false;
                end
            else
                begin
                percobaan := percobaan -1;
                writeln('username atau password yang anda masukkan salah');
                writeln('              silahkan coba lagi...');
                writeln;
                writeln('                     Kesempatan : ',percobaan);
                readln(jawabanuser);
                if percobaan = 0 then
                    status := false;
                end
        end;
    end;

    procedure regisadmin(var admin:penyedia);
    var
        status : boolean;
        i : integer;
        keterangan,usernama,katasandi : string;
    begin
        clrscr;
        status := true;
        keterangan := ('masukkan data');
        writeln('====================================');
        while status do
        begin
            clrscr;
            writeln('====================================');
            writeln(keterangan);
            writeln;
            write('username : ');
            readln(usernama);
            write('password : ');
            readln(katasandi);
            writeln;
            writeln;
            writeln('====================================');
            i := 1;
            while (i <= admin[1].Nadm) and (usernama <> admin[i].username) do
                i := i + 1;
            if usernama = '' then
                keterangan := 'Masukkan username dengan benar'
            else if usernama = admin[i].username then
                    begin
                    status := true;
                    keterangan := 'username sudah ada yang menggunakan';
                    end
            else if usernama <> admin[i].username then
                begin
                    admin[admin[1].Nadm].username := usernama;
                    admin[admin[1].Nadm].password := katasandi;
                    status := false;
                end;
        end;
        writeln;
        writeln('     Registrasi Berhasil     ');
        writeln;
        writeln('====================================');
        readln;
    end;

    procedure pilihregisadm(var admin:penyedia; var user:pengguna);
    {IS. terdefinisi parameter penyedia yaitu array berisi data admin
    FS. mengembalikan data array ke prosedur lain}
    var
        jawabanuser : char;
        status : boolean;
    begin
        status := true;
        while status do
            begin
                clrscr;
                writeln('Menu Admin//');
                writeln('====================================');
                writeln;
                writeln;
                writeln('   1. Log in                  ');
                writeln('   2. Register                ');
                writeln;
                writeln;
                writeln('                   0. Exit');
                writeln('====================================');
                write('Pilihan : ');
                readln(jawabanuser);
                if jawabanuser='1' then
                    loginadmin(admin,user)
                else if jawabanuser='2' then
                    begin
                        admin[1].Nadm := admin[1].Nadm + 1;
                        regisadmin(admin);
                    end
                else if jawabanuser = '0' then
                    status := false;
            end;
    end;

    procedure pilihuser(var admin:penyedia; var user:pengguna);
    {IS. terdefinisi parameter A yaitu array berisi data admin dan U yaitu data pengguna
    FS. mengembalikan data array dari procedure yang lain}
    var
        status : boolean;
        jawabanuser : char;
    begin
        clrscr;
        admin[2].Nadm := 0;
        admin[1].Nadm := 0;
        user[1].Nusr := 0;
        status := True;
        while status do
        begin
            clrscr;
            writeln('    Tubes M Alif Naufal Yasin  ');
            writeln('             1301184321        ');
            writeln('            IF - 42 - 09       ');
            writeln('====================================');
            writeln('            Pilih akun         ');
            writeln;
            writeln;
            writeln('     1. Admin                  ');
            writeln('     2. User                   ');
            writeln;
            writeln;
            writeln('                       0 : exit');
            writeln('====================================');
            write('Pilihan : ');
            readln(jawabanuser);
            case jawabanuser of
                '1' : pilihregisadm(admin,user);
                '2' : pilihanuser(user);
                '0' : status := false;
            end;
        end;
    end;

begin
    clrscr;
    writeln('-====================================-');
    writeln('-         SELAMAT DATANG..           -');
    writeln('-       APLIKASI LELANG BUKU         -');
    writeln('-    PERPUSTAKAAN ALIF-BA-TA-TSA     -');
    writeln('-====================================-');
    writeln('   press enter co continue..   ');
    readln;
    pilihuser(admin,user); 
end. 