# İmsakiye

Ramazan ayında iftar ve sahur vakitlerini takip etmek için iOS uygulaması. Konumunuza göre namaz vakitlerini gösterir, iftara veya sahura kalan süreyi geri sayım ile sunar.

## Özellikler

- **İftara / Sahura kalan süre** — Anlık saate göre doğru hedef vakit (İmsak öncesi → Sahur, İmsak–Akşam → İftar, Akşam sonrası → Sahur)
- **Konum bazlı vakitler** — Aladhan API ile enlem/boylama göre hesaplanan İmsak ve Akşam vakitleri
- **Anlık konum veya şehir seçimi** — Cihaz konumu veya Ayarlar’dan manuel şehir
- **Gündüz/gece arayüzü** — Güneş/Ay yayı ve gökyüzü arka planı ile vakit ilerlemesi
- SwiftUI ile modern arayüz (MVVM)

## Gereksinimler

- iOS 26.0+
- Xcode 26.0+
- Swift 5.9+

## Kurulum

1. Depoyu klonlayın:
   ```bash
   git clone https://github.com/onurakyuz/imsakiye.iOS.git
   cd imsakiye.iOS
   ```

2. Xcode ile `İftar & Sahur Timer.xcodeproj` dosyasını açın.

3. Simülatör veya bağlı cihaz seçip projeyi derleyin ve çalıştırın (⌘R).

## Proje Yapısı

```
imsakiye.iOS/
├── İftar & Sahur Timer/
│   ├── I_ftar___Sahur_TimerApp.swift   # Uygulama giriş noktası
│   ├── ContentView.swift
│   ├── ViewModels/
│   │   └── TimerViewModel.swift        # Geri sayım ve vakit mantığı
│   ├── Views/
│   │   ├── MainTabView.swift
│   │   ├── HomeView.swift
│   │   ├── MainTimerView.swift
│   │   ├── SettingsView.swift
│   │   ├── AboutView.swift
│   │   ├── SunMoonArcView.swift
│   │   ├── GlassmorphicCardView.swift
│   │   └── SkyBackgroundView.swift
│   ├── Models/
│   │   └── PrayerTimes.swift           # PrayerDay, Aladhan API modelleri
│   ├── Managers/
│   │   ├── NetworkManager.swift        # Aladhan API
│   │   └── LocationManager.swift
│   └── Utilities/
│       └── Date+Prayer.swift
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
