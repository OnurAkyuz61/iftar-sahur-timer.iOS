//
//  RamadanCalendarView.swift
//  imsakiye
//
//  Sadece Ramazan ayını gösteren takvim; bugünün günü ve bitişe kalan gün.
//

import SwiftUI

private let ramadanMonth = 9

struct RamadanCalendarView: View {
    private let islamic = Calendar(identifier: .islamicUmmAlQura)
    private let gregorian = Calendar.current

    private var ramadanYear: Int {
        let comp = islamic.dateComponents([.year, .month], from: Date())
        let year = comp.year ?? 1446
        let month = comp.month ?? 1
        return month <= ramadanMonth ? year : year + 1
    }

    private var ramadanStart: Date? {
        var comp = DateComponents()
        comp.year = ramadanYear
        comp.month = ramadanMonth
        comp.day = 1
        return islamic.date(from: comp)
    }

    private var ramadanDayCount: Int {
        guard let start = ramadanStart else { return 30 }
        guard let range = islamic.range(of: .day, in: .month, for: start) else { return 30 }
        return range.count
    }

    /// Bugün Ramazan içinde mi? (Bu takvimde gösterdiğimiz Ramazan)
    private var todayDayInRamadan: Int? {
        guard let start = ramadanStart else { return nil }
        let today = Date()
        guard today >= start else { return nil }
        let day = islamic.dateComponents([.day], from: start, to: today).day ?? 0
        let day1Based = day + 1
        return day1Based <= ramadanDayCount ? day1Based : nil
    }

    private var daysLeftUntilEnd: Int? {
        guard let today = todayDayInRamadan else { return nil }
        return max(0, ramadanDayCount - today)
    }

    private var weekdays: [String] {
        let symbols = gregorian.shortWeekdaySymbols
        let first = Locale.current.calendar.firstWeekday - 1
        if first == 0 { return symbols }
        return (symbols[first...] + symbols[..<first]).map { String($0.prefix(2)) }
    }

    var body: some View {
        ZStack {
            SkyBackgroundView(isDaytime: true, progress: 0.4)
                .ignoresSafeArea()

            ScrollView(showsIndicators: false) {
                VStack(spacing: 24) {
                    headerCard
                    statsCard
                    calendarCard
                }
                .padding(.horizontal, 20)
                .padding(.top, 56)
                .padding(.bottom, 100)
            }
        }
    }

    private var headerCard: some View {
        VStack(spacing: 8) {
            Image(systemName: "moon.stars.fill")
                .font(.system(size: 44))
                .foregroundStyle(.white.opacity(0.95))
            Text("Ramazan \(ramadanYear)")
                .font(.title2.weight(.bold))
                .foregroundStyle(.white)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 20)
        .background(
            RoundedRectangle(cornerRadius: 24, style: .continuous)
                .fill(.white.opacity(0.15))
                .overlay(
                    RoundedRectangle(cornerRadius: 24, style: .continuous)
                        .strokeBorder(.white.opacity(0.3), lineWidth: 1)
                )
        )
    }

    private var statsCard: some View {
        HStack(spacing: 16) {
            if let day = todayDayInRamadan {
                statChip(
                    title: "Bugün",
                    value: "\(day). Gün",
                    icon: "calendar.circle.fill"
                )
            } else {
                statChip(
                    title: "Ramazan",
                    value: "Yaklaşıyor",
                    icon: "moon.stars.fill"
                )
            }
            if let left = daysLeftUntilEnd {
                statChip(
                    title: "Bitişe kalan",
                    value: "\(left) gün",
                    icon: "flag.checkered"
                )
            }
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 18)
        .background(
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(.ultraThinMaterial)
                .overlay(
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .strokeBorder(.white.opacity(0.25), lineWidth: 1)
                )
        )
    }

    private func statChip(title: String, value: String, icon: String) -> some View {
        HStack(spacing: 12) {
            Image(systemName: icon)
                .font(.title2)
                .foregroundStyle(.white.opacity(0.9))
            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.caption.weight(.medium))
                    .foregroundStyle(.white.opacity(0.8))
                Text(value)
                    .font(.headline.weight(.bold))
                    .foregroundStyle(.white)
            }
            Spacer(minLength: 0)
        }
        .frame(maxWidth: .infinity)
    }

    private var calendarCard: some View {
        VStack(spacing: 16) {
            HStack(spacing: 0) {
                ForEach(weekdays, id: \.self) { w in
                    Text(w)
                        .font(.caption.weight(.semibold))
                        .foregroundStyle(.white.opacity(0.7))
                        .frame(maxWidth: .infinity)
                }
            }
            .padding(.horizontal, 4)

            let columns = Array(repeating: GridItem(.flexible(), spacing: 8), count: 7)
            let firstWeekday: Int = {
                guard let start = ramadanStart else { return 0 }
                return gregorian.component(.weekday, from: start) - gregorian.firstWeekday
            }()
            let leadingBlanks = (firstWeekday + 7) % 7

            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(0..<leadingBlanks, id: \.self) { _ in
                    Color.clear
                        .frame(height: 44)
                }
                ForEach(1...ramadanDayCount, id: \.self) { day in
                    dayCell(day: day)
                }
            }
        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 24, style: .continuous)
                .fill(.white.opacity(0.12))
                .overlay(
                    RoundedRectangle(cornerRadius: 24, style: .continuous)
                        .strokeBorder(.white.opacity(0.28), lineWidth: 1)
                )
        )
    }

    private func dayCell(day: Int) -> some View {
        let isToday = todayDayInRamadan == day
        return Text("\(day)")
            .font(.system(.body, design: .rounded).weight(isToday ? .bold : .medium))
            .foregroundStyle(isToday ? .black : .white.opacity(0.95))
            .frame(maxWidth: .infinity)
            .frame(height: 44)
            .background(
                RoundedRectangle(cornerRadius: 12, style: .continuous)
                    .fill(isToday ? Color.white : Color.white.opacity(0.15))
            )
    }
}

#Preview {
    RamadanCalendarView()
}
