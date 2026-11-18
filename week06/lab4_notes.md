# Lab 4 Notes – Data Manipulation Language (DML)

**Name:** PHILLIP PAUL OLADEJO  
**Matric Number:** VUG/SEN/24/11986  
**Course:** SEN 307 – Database Systems

## Error 1451 – Cannot Delete Parent Row

During Part 4 of the practical, I attempted to delete the `Library and Information Science` department while a student named `Transfer Student` was still assigned to it.

MySQL returned Error 1451 because the department was referenced by a record in the Student table through a foreign key constraint.

### Why MySQL Refused the Deletion

MySQL prevents the deletion of a parent record when another table still references it. This maintains referential integrity and prevents orphaned records.

### How I Fixed the Error

I reassigned the Transfer Student to the Software Engineering department by updating the student's `dept_id`.

After successfully changing the department assignment, I deleted the `Library and Information Science` department.

### Another Possible Solution

Another possible solution would be to delete the dependent student record before deleting the department. However, this would remove the student's information. Reassigning the student was preferable because it preserved the record.

## Final Database Verification

The final database counts were:

- Departments: 5
- Lecturers: 10
- Students: 21
- Courses: 10
- Enrolments: 40
- Course Allocations: 11

All required records were successfully inserted, updated, and verified.