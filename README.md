# İftar & Sahur Timer

Ramazan ayında iftar ve sahur vakitlerini takip etmek için iOS uygulaması.

## Özellikler

- İftar ve sahur vakitlerini görüntüleme
- SwiftUI ile modern arayüz
- SwiftData ile yerel veri saklama

## Gereksinimler

- iOS 17.0+
- Xcode 15.0+
- Swift 5.9+

## Kurulum

1. Depoyu klonlayın:
   ```bash
   git clone https://github.com/onurakyuz/iftar-sahur-timer.iOS.git
   cd iftar-sahur-timer.iOS
   ```

2. Xcode ile `İftar & Sahur Timer.xcodeproj` dosyasını açın.

3. Simülatör veya bağlı cihaz seçip projeyi derleyin ve çalıştırın (⌘R).

## Proje Yapısı

```
İftar & Sahur Timer/
├── İftar & Sahur Timer/
│   ├── ContentView.swift      # Ana ekran
│   ├── Item.swift             # Veri modeli
│   └── I_ftar___Sahur_TimerApp.swift  # Uygulama giriş noktası
└── İftar & Sahur Timer.xcodeproj
```

## Lisans

Bu proje [MIT Lisansı](LICENSE) altında lisanslanmıştır.

## Katkıda Bulunma

1. Bu depoyu fork edin
2. Yeni bir dal oluşturun (`git checkout -b feature/yeni-ozellik`)
3. Değişikliklerinizi commit edin (`git commit -m 'Yeni özellik eklendi'`)
4. Dalı push edin (`git push origin feature/yeni-ozellik`)
5. Pull Request açın
