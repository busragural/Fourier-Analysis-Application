clc; 
clear; 
close all;

%ORNEK.WAV ANALIZI

[mytel,fs] = audioread("Ornek.wav");
n=11;
d = floor(length(mytel) / n);
t = 100000/fs;
a = 1:t:100000 * (length(mytel) / fs);
a = a / 100000;


subplot(2,1,1);
plot(a, mytel);
ylabel('Genlik');
xlabel('Zaman');
grid;
title("'Ornek.wav' Sesinin Sürekli Grafiği");


subplot(2,1,2);
stem(a, mytel);
xlabel('Zaman');
ylabel('Genlik');
title("'Ornek.wav' Sesinin Ayrık Grafiği");
grid;
 
fprintf("'Ornek.wav' ses dosyasındaki numara: ");

for i=1:n

    tus = "";
    ornek1 = abs(fft(mytel(1+((i-1)*d):i*d),fs));   % 1->1d.....1+d->2d 
    ornek2=(ornek1(1:floor(length(ornek1)/2)+1)); 
            
    [deger, konum] = maxk(ornek2, 2);   %maksimum iki degeri buluyorum
    
    if (konum(1) > konum(2))
        kucuk = konum(2);
        buyuk = konum(1);
    else 
        kucuk = konum(1);
        buyuk = konum(2);
    end
    
    if (kucuk>697 && kucuk<770) 
        if(buyuk>1209 && buyuk<1336)
            tus = "1";
        elseif(buyuk>1336 && buyuk<1447)
            tus = "2";
        elseif(buyuk>1477)
            tus = "3";
        end

    elseif (kucuk>770 && kucuk<852)
        if(buyuk>1209 && buyuk<1336)
            tus = "4";
        elseif(buyuk>1336 && buyuk<1447)
            tus = "5";
        elseif(buyuk>1477)
            tus = "6";
        end

    elseif (kucuk>852 && kucuk<941) 
        if(buyuk>1209 && buyuk<1336)
            tus = "7";
        elseif(buyuk>1336 && buyuk<1447)
            tus = "8";
        elseif(buyuk>1477)
            tus = "9";
        end
    elseif (kucuk>941)
        tus = "0";
    end

      fprintf("%s",tus);
      figure
      plot(ornek2);
      title("Frekans Spektrumu - Tuş: " + tus);
      xlabel("Frekans");
      ylabel("Büyüklük");
      
      hold on
            
end

%KENDİ NUMARAMIN OLDUĞU KISIM

numara = '05986547213';

sound = [];                %yeni ses     
fs = 8000;

for i = 1:length(numara)

    if(strcmp(numara(i), '0') == 1)
        c1 = 941;
        c2 = 1336;

    elseif(strcmp(numara(i), '1') == 1)
        c1 = 697;
        c2 = 1209;

    elseif(strcmp(numara(i), '2') == 1)
        c1 = 697;
        c2 = 1336;

    elseif(strcmp(numara(i), '3') == 1)
        c1 = 697;
        c2 = 1477;

    elseif(strcmp(numara(i), '4') == 1)
        c1 = 770;
        c2 = 1209;

    elseif(strcmp(numara(i), '5') == 1)
        c1 = 770;
        c2 = 1336;

    elseif(strcmp(numara(i), '6') == 1)
        c1 = 770;
        c2 = 1477;

    elseif(strcmp(numara(i), '7') == 1)
        c1 = 852;
        c2 = 1209;

    elseif(strcmp(numara(i), '8') == 1)
        c1 = 852;
        c2 = 1336;

    elseif(strcmp(numara(i), '9') == 1)
        c1 = 852;
        c2 = 1477;
    end
    
    sure = 0.05; %tuşlamalar arası süreyi bu kadar kısa almamın nedeni grafiğin daha güzel görünmesi için 
                  %tuşlamayı daha rahat anlamak için 0.3 yapabilirsiniz

    t = linspace(0, sure, sure*fs); %0'dan baslayip verilen sureye kadar sure*fs kadar esit aralikli dizi olusturuyorum
    frekans1 = sin(2*pi*c1*t); 
    frekans2 = sin(2*pi*c2*t);
    sayi = frekans1 + frekans2;
    sound = horzcat(sound, sayi); %sayiyi sound dizisine ekliyorum

     
      figure
      p = abs(fft(sayi, fs));
      plot(p(1:length(p)/2));
      xlabel("Frekans");
      ylabel("Büyüklük"); 
      title("Frekans Spektrumu - Tuş: " + numara(i));
     
end

audiowrite('05986547213.wav', sound, fs);

%Kendi numaramın grafiği

[mytel,fs] = audioread("05986547213.wav");
n=11;
d = floor(length(mytel) / n);
t = 100000/fs;
a = 1:t:100000 * (length(mytel) / fs);
a = a / 100000;


subplot(2,1,1);
plot(a, mytel);
ylabel('Genlik');
xlabel('Zaman');
grid;
title("'05986547213.wav' Sesinin Sürekli Grafiği");


subplot(2,1,2);
stem(a, mytel);
xlabel('Zaman');
ylabel('Genlik');
title("'05986547213.wav' Sesinin Ayrık Grafiği");
grid;
            

