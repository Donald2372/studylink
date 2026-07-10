-- VÃ©rification finale du cours allemand A1-C1
SELECT c.id,c.title,c.slug,COUNT(DISTINCT m.id) AS module_count,COUNT(DISTINCT l.id) AS lesson_count
FROM public.courses c
LEFT JOIN public.course_modules m ON m.course_id=c.id
LEFT JOIN public.lessons l ON l.module_id=m.id
WHERE c.slug='allemand-complet-a1-c1'
GROUP BY c.id,c.title,c.slug;


