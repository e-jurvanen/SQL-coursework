CREATE INDEX "student_ids" ON "enrollments" ("student_id");

CREATE INDEX "course_depratment" ON "courses" ("department");
CREATE INDEX "course_ids" ON "enrollments" ("course_id");

CREATE INDEX "course_semester" ON "courses" ("semester");

CREATE INDEX "course_ids2" ON "satisfies" ("course_id");

