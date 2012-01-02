Bu depoyu fork ederek aşağıdaki görevler üzerinde çalışın.

1. `_scripts/presentation.rake` dosyasında ne yapıldığını ilgili yerlerde
   açıklama satırları ekleyerek anlatın.  Bu dosya
   [19/s](https://github.com/00010011/s) deposundan alınmıştır.  Bu depoyu da
   incelemeniz tavsiye edilir.

2. Derste ayrıntılı anlatıldığı şekilde `_exams` dizini altındaki **tüm** `.yml`
   dosyalardan (şimdilik sadece bir örnek dosya var) `.pdf` uzantılı sınav
   kağıtlarını üretecek Rake görevini `_scripts/exam.rake` içinde kodlayın, öyle
   ki sınav kağıtları aşağıdaki komutla (sadece gerekiyorsa) üretilsin:

            rake exam

   Sorular (soru bankası) `_includes/q` dizinindedir.  Sınav kağıdını üretecek
   ERB şablonu `_templates/exam.md.erb`'dir (bu şablonu siz yazacaksınız).

   PDF üretiminde "pandoc" paketiyle birlikte gelen `markdown2pdf` programını
   kullanın.
