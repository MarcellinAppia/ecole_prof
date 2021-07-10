class Mark {
    Mark({
        this.id,
        this.mark,
        this.maximumMark,
        this.trimestre,
        this.coefficient,
        this.appreciation,
        this.date,
    });

    int? id;
    int? mark;
    int? maximumMark;
    String? trimestre;
    int? coefficient;
    String? appreciation;
    DateTime? date;

    factory Mark.fromJson(Map<String, dynamic> json) => Mark(
        id: json["id"],
        mark: json["mark"],
        maximumMark: json["maximum_mark"],
        trimestre: json["trimestre"],
        coefficient: json["coefficient"],
        appreciation: json["appreciation"],
        date: DateTime.parse(json["date"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "mark": mark,
        "maximum_mark": maximumMark,
        "trimestre": trimestre,
        "coefficient": coefficient,
        "appreciation": appreciation,
        "date": date!.toIso8601String(),
    };
}

