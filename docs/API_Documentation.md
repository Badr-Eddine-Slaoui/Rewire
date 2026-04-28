# Rewire API Documentation (Source of Truth)

This documentation is generated directly from the codebase (Controllers and FormRequests).


## Auth Module

### POST /api/login

- **Controller Action:** `AuthController@login`

- **Authorization:** None (Guest)


**Request Body / Payload (Validated via `LoginRequest`):**

| Field | Type | Required | Validation Rules |

|-------|------|----------|------------------|

| `email` | `string` | Yes | required, string, max:150, email |

| `password` | `string` | Yes | required, string |


**Expected Responses:**

- `201 Created`: Returns the newly created resource data.

- `422 Unprocessable Entity`: Validation errors.

---

### GET /api/me

- **Controller Action:** `AuthController@me`

- **Authorization:** Bearer Token


**Expected Responses:**

---

### POST /api/logout

- **Controller Action:** `AuthController@logout`

- **Authorization:** Bearer Token


**Request Body:** Accepts JSON payload.


**Expected Responses:**

- `201 Created`: Returns the newly created resource data.

- `422 Unprocessable Entity`: Validation errors.

---

## Admin Module

### GET /api/admin/

- **Controller Action:** `AdminController@index`

- **Authorization:** Bearer Token (Admin)


**Expected Responses:**

- `200 OK`: Returns a paginated/list array of the resource.

---

## ScholarYear Module

### GET /api/admin/scholar-years

- **Controller Action:** `ScholarYearController@index`

- **Authorization:** Bearer Token (Admin)


**Expected Responses:**

- `200 OK`: Returns a paginated/list array of the resource.

---

### GET /api/admin/scholar-years/{id}

- **Controller Action:** `ScholarYearController@show`

- **Authorization:** Bearer Token (Admin)


**Path Parameters:**

| Name | Type | Description |

|------|------|-------------|

| `id` | integer/string | The id of the resource. |


**Expected Responses:**

- `200 OK`: Returns the details of the specific resource.

---

### POST /api/admin/scholar-years

- **Controller Action:** `ScholarYearController@store`

- **Authorization:** Bearer Token (Admin)


**Request Body / Payload (Validated via `ScholarYearRequest`):**

| Field | Type | Required | Validation Rules |

|-------|------|----------|------------------|

| `start_year` | `string` | Yes | "required" |

| `end_year` | `string` | Yes | "required, after:start_year" |

| `capacity` | `string` | Yes | "required" |


**Expected Responses:**

- `201 Created`: Returns the newly created resource data.

- `422 Unprocessable Entity`: Validation errors.

---

### PUT /api/admin/scholar-years/{id}

- **Controller Action:** `ScholarYearController@update`

- **Authorization:** Bearer Token (Admin)


**Path Parameters:**

| Name | Type | Description |

|------|------|-------------|

| `id` | integer/string | The id of the resource. |


**Request Body / Payload (Validated via `ScholarYearRequest`):**

| Field | Type | Required | Validation Rules |

|-------|------|----------|------------------|

| `start_year` | `string` | Yes | "required" |

| `end_year` | `string` | Yes | "required, after:start_year" |

| `capacity` | `string` | Yes | "required" |


**Expected Responses:**

- `200 OK`: Returns the updated resource.

- `422 Unprocessable Entity`: Validation errors.

---

### DELETE /api/admin/scholar-years/{id}

- **Controller Action:** `ScholarYearController@destroy`

- **Authorization:** Bearer Token (Admin)


**Path Parameters:**

| Name | Type | Description |

|------|------|-------------|

| `id` | integer/string | The id of the resource. |


**Expected Responses:**

- `200/204 OK`: Resource deleted successfully.

---

### POST /api/admin/scholar-years/{id}/restore

- **Controller Action:** `ScholarYearController@restore`

- **Authorization:** Bearer Token (Admin)


**Path Parameters:**

| Name | Type | Description |

|------|------|-------------|

| `id` | integer/string | The id of the resource. |


**Request Body:** Accepts JSON payload.


**Expected Responses:**

- `201 Created`: Returns the newly created resource data.

- `422 Unprocessable Entity`: Validation errors.

---

## GradeLevel Module

### GET /api/admin/grade-levels

- **Controller Action:** `GradeLevelController@index`

- **Authorization:** Bearer Token (Admin)


**Expected Responses:**

- `200 OK`: Returns a paginated/list array of the resource.

---

### GET /api/admin/grade-levels/{id}

- **Controller Action:** `GradeLevelController@show`

- **Authorization:** Bearer Token (Admin)


**Path Parameters:**

| Name | Type | Description |

|------|------|-------------|

| `id` | integer/string | The id of the resource. |


**Expected Responses:**

- `200 OK`: Returns the details of the specific resource.

---

### POST /api/admin/grade-levels

- **Controller Action:** `GradeLevelController@store`

- **Authorization:** Bearer Token (Admin)


**Request Body / Payload (Validated via `GradeLevelRequest`):**

| Field | Type | Required | Validation Rules |

|-------|------|----------|------------------|

| `name` | `string` | Yes | required, string, min:2, max:50 |

| `capacity` | `integer` | Yes | required, integer |

| `description` | `string` | Yes | required, string, min:2 |

| `scholar_year_id` | `string` | Yes | required, exists:scholar_years,id |


**Expected Responses:**

- `201 Created`: Returns the newly created resource data.

- `422 Unprocessable Entity`: Validation errors.

---

### PUT /api/admin/grade-levels/{id}

- **Controller Action:** `GradeLevelController@update`

- **Authorization:** Bearer Token (Admin)


**Path Parameters:**

| Name | Type | Description |

|------|------|-------------|

| `id` | integer/string | The id of the resource. |


**Request Body / Payload (Validated via `GradeLevelRequest`):**

| Field | Type | Required | Validation Rules |

|-------|------|----------|------------------|

| `name` | `string` | Yes | required, string, min:2, max:50 |

| `capacity` | `integer` | Yes | required, integer |

| `description` | `string` | Yes | required, string, min:2 |

| `scholar_year_id` | `string` | Yes | required, exists:scholar_years,id |


**Expected Responses:**

- `200 OK`: Returns the updated resource.

- `422 Unprocessable Entity`: Validation errors.

---

### DELETE /api/admin/grade-levels/{id}

- **Controller Action:** `GradeLevelController@destroy`

- **Authorization:** Bearer Token (Admin)


**Path Parameters:**

| Name | Type | Description |

|------|------|-------------|

| `id` | integer/string | The id of the resource. |


**Expected Responses:**

- `200/204 OK`: Resource deleted successfully.

---

### POST /api/admin/grade-levels/{id}/restore

- **Controller Action:** `GradeLevelController@restore`

- **Authorization:** Bearer Token (Admin)


**Path Parameters:**

| Name | Type | Description |

|------|------|-------------|

| `id` | integer/string | The id of the resource. |


**Request Body:** Accepts JSON payload.


**Expected Responses:**

- `201 Created`: Returns the newly created resource data.

- `422 Unprocessable Entity`: Validation errors.

---

## Formation Module

### GET /api/admin/formations

- **Controller Action:** `FormationController@index`

- **Authorization:** Bearer Token (Admin)


**Expected Responses:**

- `200 OK`: Returns a paginated/list array of the resource.

---

### GET /api/admin/formations/{id}

- **Controller Action:** `FormationController@show`

- **Authorization:** Bearer Token (Admin)


**Path Parameters:**

| Name | Type | Description |

|------|------|-------------|

| `id` | integer/string | The id of the resource. |


**Expected Responses:**

- `200 OK`: Returns the details of the specific resource.

---

### POST /api/admin/formations

- **Controller Action:** `FormationController@store`

- **Authorization:** Bearer Token (Admin)


**Request Body / Payload (Validated via `FormationRequest`):**

| Field | Type | Required | Validation Rules |

|-------|------|----------|------------------|

| `grade_level_id` | `string` | Yes | required, exists:grade_levels,id |

| `title` | `string` | Yes | required, string, min:2, max:50 |

| `description` | `string` | Yes | required, string, min:2 |

| `duration` | `integer` | Yes | required, integer |

| `capacity` | `integer` | Yes | required, integer |


**Expected Responses:**

- `201 Created`: Returns the newly created resource data.

- `422 Unprocessable Entity`: Validation errors.

---

### PUT /api/admin/formations/{id}

- **Controller Action:** `FormationController@update`

- **Authorization:** Bearer Token (Admin)


**Path Parameters:**

| Name | Type | Description |

|------|------|-------------|

| `id` | integer/string | The id of the resource. |


**Request Body / Payload (Validated via `FormationRequest`):**

| Field | Type | Required | Validation Rules |

|-------|------|----------|------------------|

| `grade_level_id` | `string` | Yes | required, exists:grade_levels,id |

| `title` | `string` | Yes | required, string, min:2, max:50 |

| `description` | `string` | Yes | required, string, min:2 |

| `duration` | `integer` | Yes | required, integer |

| `capacity` | `integer` | Yes | required, integer |


**Expected Responses:**

- `200 OK`: Returns the updated resource.

- `422 Unprocessable Entity`: Validation errors.

---

### DELETE /api/admin/formations/{id}

- **Controller Action:** `FormationController@destroy`

- **Authorization:** Bearer Token (Admin)


**Path Parameters:**

| Name | Type | Description |

|------|------|-------------|

| `id` | integer/string | The id of the resource. |


**Expected Responses:**

- `200/204 OK`: Resource deleted successfully.

---

### POST /api/admin/formations/{id}/restore

- **Controller Action:** `FormationController@restore`

- **Authorization:** Bearer Token (Admin)


**Path Parameters:**

| Name | Type | Description |

|------|------|-------------|

| `id` | integer/string | The id of the resource. |


**Request Body:** Accepts JSON payload.


**Expected Responses:**

- `201 Created`: Returns the newly created resource data.

- `422 Unprocessable Entity`: Validation errors.

---

## ClassGroup Module

### GET /api/admin/class-groups

- **Controller Action:** `ClassGroupController@index`

- **Authorization:** Bearer Token (Admin)


**Expected Responses:**

- `200 OK`: Returns a paginated/list array of the resource.

---

### GET /api/admin/class-groups/{id}

- **Controller Action:** `ClassGroupController@show`

- **Authorization:** Bearer Token (Admin)


**Path Parameters:**

| Name | Type | Description |

|------|------|-------------|

| `id` | integer/string | The id of the resource. |


**Expected Responses:**

- `200 OK`: Returns the details of the specific resource.

---

### POST /api/admin/class-groups

- **Controller Action:** `ClassGroupController@store`

- **Authorization:** Bearer Token (Admin)


**Request Body / Payload (Validated via `ClassGroupRequest`):**

| Field | Type | Required | Validation Rules |

|-------|------|----------|------------------|

| `formation_id` | `string` | Yes | required, exists:formations,id |

| `name` | `string` | Yes | required, string, min:2, max:50 |

| `image_url` | `string` | Yes | required, url |

| `capacity` | `integer` | Yes | required, integer, min:1 |

| `description` | `string` | Yes | required, string, min:2 |

| `main_teacher_id` | `string` | Yes | "required, exists:users,id" |

| `sub_teacher_id` | `string` | Yes | "required, exists:users,id" |

| `students_ids` | `array` | Yes | "required, array" |


**Expected Responses:**

- `201 Created`: Returns the newly created resource data.

- `422 Unprocessable Entity`: Validation errors.

---

### PUT /api/admin/class-groups/{id}

- **Controller Action:** `ClassGroupController@update`

- **Authorization:** Bearer Token (Admin)


**Path Parameters:**

| Name | Type | Description |

|------|------|-------------|

| `id` | integer/string | The id of the resource. |


**Request Body / Payload (Validated via `ClassGroupRequest`):**

| Field | Type | Required | Validation Rules |

|-------|------|----------|------------------|

| `formation_id` | `string` | Yes | required, exists:formations,id |

| `name` | `string` | Yes | required, string, min:2, max:50 |

| `image_url` | `string` | Yes | required, url |

| `capacity` | `integer` | Yes | required, integer, min:1 |

| `description` | `string` | Yes | required, string, min:2 |

| `main_teacher_id` | `string` | Yes | "required, exists:users,id" |

| `sub_teacher_id` | `string` | Yes | "required, exists:users,id" |

| `students_ids` | `array` | Yes | "required, array" |


**Expected Responses:**

- `200 OK`: Returns the updated resource.

- `422 Unprocessable Entity`: Validation errors.

---

### DELETE /api/admin/class-groups/{id}

- **Controller Action:** `ClassGroupController@destroy`

- **Authorization:** Bearer Token (Admin)


**Path Parameters:**

| Name | Type | Description |

|------|------|-------------|

| `id` | integer/string | The id of the resource. |


**Expected Responses:**

- `200/204 OK`: Resource deleted successfully.

---

### POST /api/admin/class-groups/{id}/restore

- **Controller Action:** `ClassGroupController@restore`

- **Authorization:** Bearer Token (Admin)


**Path Parameters:**

| Name | Type | Description |

|------|------|-------------|

| `id` | integer/string | The id of the resource. |


**Request Body:** Accepts JSON payload.


**Expected Responses:**

- `201 Created`: Returns the newly created resource data.

- `422 Unprocessable Entity`: Validation errors.

---

### GET /api/admin/class-groups

- **Controller Action:** `ClassGroupController@get_teacher_class_groups`

- **Authorization:** Bearer Token (Admin)


**Expected Responses:**

---

## User Module

### GET /api/admin/users

- **Controller Action:** `UserController@index`

- **Authorization:** Bearer Token (Admin)


**Expected Responses:**

- `200 OK`: Returns a paginated/list array of the resource.

---

### GET /api/admin/users/main_teachers/{class_group?}

- **Controller Action:** `UserController@get_main_teachers`

- **Authorization:** Bearer Token (Admin)


**Path Parameters:**

| Name | Type | Description |

|------|------|-------------|

| `class_group?` | integer/string | The class_group? of the resource. |


**Expected Responses:**

---

### GET /api/admin/users/sub_teachers/{class_group?}

- **Controller Action:** `UserController@get_sub_teachers`

- **Authorization:** Bearer Token (Admin)


**Path Parameters:**

| Name | Type | Description |

|------|------|-------------|

| `class_group?` | integer/string | The class_group? of the resource. |


**Expected Responses:**

---

### GET /api/users/students/{class_group?}

- **Controller Action:** `UserController@get_students`

- **Authorization:** Bearer Token (Student)


**Path Parameters:**

| Name | Type | Description |

|------|------|-------------|

| `class_group?` | integer/string | The class_group? of the resource. |


**Expected Responses:**

---

### GET /api/admin/users/{role}/{id}

- **Controller Action:** `UserController@show`

- **Authorization:** Bearer Token (Admin)


**Path Parameters:**

| Name | Type | Description |

|------|------|-------------|

| `role` | integer/string | The role of the resource. |

| `id` | integer/string | The id of the resource. |


**Expected Responses:**

- `200 OK`: Returns the details of the specific resource.

---

### POST /api/admin/users

- **Controller Action:** `UserController@store`

- **Authorization:** Bearer Token (Admin)


**Request Body / Payload (Validated via `UserRequest`):**

| Field | Type | Required | Validation Rules |

|-------|------|----------|------------------|

| `first_name` | `string` | Yes | "required, string, min:2, max:50" |

| `last_name` | `string` | Yes | "required, string, min:2, max:50" |

| `age` | `integer` | Yes | "required, integer, min:18, max:35" |

| `email` | `string` | Yes | "required, email, unique:users,email" . ($except ? , . $this->route(user)->id : ) |

| `cin` | `string` | Yes | "required, string, min:8, max:8, unique:users,cin" . ($except ? , . $this->route(user)->id : ) |

| `phone` | `string` | Yes | "required, string, min:10, max:12, unique:users,phone" . ($except ? , . $this->route(user)->id : ) |

| `password` | `string` | Yes | $except ? "nullable" : "required, string, min:8, max:50" |

| `role` | `string` | Yes | "required, string, in:STUDENT,TEACHER,ADMIN" |


**Expected Responses:**

- `201 Created`: Returns the newly created resource data.

- `422 Unprocessable Entity`: Validation errors.

---

### PUT /api/admin/users/{id}

- **Controller Action:** `UserController@update`

- **Authorization:** Bearer Token (Admin)


**Path Parameters:**

| Name | Type | Description |

|------|------|-------------|

| `id` | integer/string | The id of the resource. |


**Request Body / Payload (Validated via `UserRequest`):**

| Field | Type | Required | Validation Rules |

|-------|------|----------|------------------|

| `first_name` | `string` | Yes | "required, string, min:2, max:50" |

| `last_name` | `string` | Yes | "required, string, min:2, max:50" |

| `age` | `integer` | Yes | "required, integer, min:18, max:35" |

| `email` | `string` | Yes | "required, email, unique:users,email" . ($except ? , . $this->route(user)->id : ) |

| `cin` | `string` | Yes | "required, string, min:8, max:8, unique:users,cin" . ($except ? , . $this->route(user)->id : ) |

| `phone` | `string` | Yes | "required, string, min:10, max:12, unique:users,phone" . ($except ? , . $this->route(user)->id : ) |

| `password` | `string` | Yes | $except ? "nullable" : "required, string, min:8, max:50" |

| `role` | `string` | Yes | "required, string, in:STUDENT,TEACHER,ADMIN" |


**Expected Responses:**

- `200 OK`: Returns the updated resource.

- `422 Unprocessable Entity`: Validation errors.

---

### DELETE /api/admin/users/{id}

- **Controller Action:** `UserController@destroy`

- **Authorization:** Bearer Token (Admin)


**Path Parameters:**

| Name | Type | Description |

|------|------|-------------|

| `id` | integer/string | The id of the resource. |


**Expected Responses:**

- `200/204 OK`: Resource deleted successfully.

---

### POST /api/admin/users/{id}/restore

- **Controller Action:** `UserController@restore`

- **Authorization:** Bearer Token (Admin)


**Path Parameters:**

| Name | Type | Description |

|------|------|-------------|

| `id` | integer/string | The id of the resource. |


**Request Body:** Accepts JSON payload.


**Expected Responses:**

- `201 Created`: Returns the newly created resource data.

- `422 Unprocessable Entity`: Validation errors.

---

### GET /api/class-groups/{id}/students

- **Controller Action:** `UserController@get_class_group_students`

- **Authorization:** Bearer Token (Student)


**Path Parameters:**

| Name | Type | Description |

|------|------|-------------|

| `id` | integer/string | The id of the resource. |


**Expected Responses:**

---

## Level Module

### GET /api/levels

- **Controller Action:** `LevelController@index`

- **Authorization:** Bearer Token


**Expected Responses:**

- `200 OK`: Returns a paginated/list array of the resource.

---

### GET /api/levels/{id}

- **Controller Action:** `LevelController@show`

- **Authorization:** Bearer Token


**Path Parameters:**

| Name | Type | Description |

|------|------|-------------|

| `id` | integer/string | The id of the resource. |


**Expected Responses:**

- `200 OK`: Returns the details of the specific resource.

---

### POST /api/levels

- **Controller Action:** `LevelController@store`

- **Authorization:** Bearer Token


**Request Body / Payload (Validated via `LevelRequest`):**

| Field | Type | Required | Validation Rules |

|-------|------|----------|------------------|

| `name` | `string` | Yes | required, string, min:2, max:50 |

| `description` | `string` | Yes | required, string, min:2 |

| `order` | `integer` | Yes | required, integer |


**Expected Responses:**

- `201 Created`: Returns the newly created resource data.

- `422 Unprocessable Entity`: Validation errors.

---

### PUT /api/levels/{id}

- **Controller Action:** `LevelController@update`

- **Authorization:** Bearer Token


**Path Parameters:**

| Name | Type | Description |

|------|------|-------------|

| `id` | integer/string | The id of the resource. |


**Request Body / Payload (Validated via `LevelRequest`):**

| Field | Type | Required | Validation Rules |

|-------|------|----------|------------------|

| `name` | `string` | Yes | required, string, min:2, max:50 |

| `description` | `string` | Yes | required, string, min:2 |

| `order` | `integer` | Yes | required, integer |


**Expected Responses:**

- `200 OK`: Returns the updated resource.

- `422 Unprocessable Entity`: Validation errors.

---

### DELETE /api/levels/{id}

- **Controller Action:** `LevelController@destroy`

- **Authorization:** Bearer Token


**Path Parameters:**

| Name | Type | Description |

|------|------|-------------|

| `id` | integer/string | The id of the resource. |


**Expected Responses:**

- `200/204 OK`: Resource deleted successfully.

---

### POST /api/levels/{id}/restore

- **Controller Action:** `LevelController@restore`

- **Authorization:** Bearer Token


**Path Parameters:**

| Name | Type | Description |

|------|------|-------------|

| `id` | integer/string | The id of the resource. |


**Request Body:** Accepts JSON payload.


**Expected Responses:**

- `201 Created`: Returns the newly created resource data.

- `422 Unprocessable Entity`: Validation errors.

---

## Skill Module

### GET /api/skills

- **Controller Action:** `SkillController@index`

- **Authorization:** Bearer Token


**Expected Responses:**

- `200 OK`: Returns a paginated/list array of the resource.

---

### GET /api/skills/formation/{id}

- **Controller Action:** `SkillController@get_by_formaction_id`

- **Authorization:** Bearer Token


**Path Parameters:**

| Name | Type | Description |

|------|------|-------------|

| `id` | integer/string | The id of the resource. |


**Expected Responses:**

---

### GET /api/skills/{id}

- **Controller Action:** `SkillController@show`

- **Authorization:** Bearer Token


**Path Parameters:**

| Name | Type | Description |

|------|------|-------------|

| `id` | integer/string | The id of the resource. |


**Expected Responses:**

- `200 OK`: Returns the details of the specific resource.

---

### POST /api/skills

- **Controller Action:** `SkillController@store`

- **Authorization:** Bearer Token


**Request Body / Payload (Validated via `SkillRequest`):**

| Field | Type | Required | Validation Rules |

|-------|------|----------|------------------|

| `formation_id` | `string` | Yes | required, exists:formations,id |

| `code` | `string` | Yes | required, string, min:2, max:50 |

| `title` | `string` | Yes | required, string, min:2, max:50 |

| `description` | `string` | Yes | required, string, min:2 |

| `skill_levels` | `array` | Yes | required, array, min:1 |

| `skill_levels.*.level_id` | `string` | Yes | required, exists:levels,id |

| `skill_levels.*.criteria` | `string` | Yes | required, string |


**Expected Responses:**

- `201 Created`: Returns the newly created resource data.

- `422 Unprocessable Entity`: Validation errors.

---

### PUT /api/skills/{id}

- **Controller Action:** `SkillController@update`

- **Authorization:** Bearer Token


**Path Parameters:**

| Name | Type | Description |

|------|------|-------------|

| `id` | integer/string | The id of the resource. |


**Request Body / Payload (Validated via `SkillRequest`):**

| Field | Type | Required | Validation Rules |

|-------|------|----------|------------------|

| `formation_id` | `string` | Yes | required, exists:formations,id |

| `code` | `string` | Yes | required, string, min:2, max:50 |

| `title` | `string` | Yes | required, string, min:2, max:50 |

| `description` | `string` | Yes | required, string, min:2 |

| `skill_levels` | `array` | Yes | required, array, min:1 |

| `skill_levels.*.level_id` | `string` | Yes | required, exists:levels,id |

| `skill_levels.*.criteria` | `string` | Yes | required, string |


**Expected Responses:**

- `200 OK`: Returns the updated resource.

- `422 Unprocessable Entity`: Validation errors.

---

### DELETE /api/skills/{id}

- **Controller Action:** `SkillController@destroy`

- **Authorization:** Bearer Token


**Path Parameters:**

| Name | Type | Description |

|------|------|-------------|

| `id` | integer/string | The id of the resource. |


**Expected Responses:**

- `200/204 OK`: Resource deleted successfully.

---

### POST /api/skills/{id}/restore

- **Controller Action:** `SkillController@restore`

- **Authorization:** Bearer Token


**Path Parameters:**

| Name | Type | Description |

|------|------|-------------|

| `id` | integer/string | The id of the resource. |


**Request Body:** Accepts JSON payload.


**Expected Responses:**

- `201 Created`: Returns the newly created resource data.

- `422 Unprocessable Entity`: Validation errors.

---

## Sprint Module

### GET /api/sprints

- **Controller Action:** `SprintController@index`

- **Authorization:** Bearer Token


**Expected Responses:**

- `200 OK`: Returns a paginated/list array of the resource.

---

### GET /api/sprints/{id}

- **Controller Action:** `SprintController@show`

- **Authorization:** Bearer Token


**Path Parameters:**

| Name | Type | Description |

|------|------|-------------|

| `id` | integer/string | The id of the resource. |


**Expected Responses:**

- `200 OK`: Returns the details of the specific resource.

---

### POST /api/sprints

- **Controller Action:** `SprintController@store`

- **Authorization:** Bearer Token


**Request Body / Payload (Validated via `SprintRequest`):**

| Field | Type | Required | Validation Rules |

|-------|------|----------|------------------|

| `formation_id` | `string` | Yes | required, exists:formations,id |

| `name` | `string` | Yes | required, string, min:2, max:50 |

| `description` | `string` | Yes | required, string, min:2 |

| `start_date` | `date` | Yes | required, date |

| `end_date` | `date` | Yes | required, date, after:start_date |

| `skills` | `array` | Yes | required, array |


**Expected Responses:**

- `201 Created`: Returns the newly created resource data.

- `422 Unprocessable Entity`: Validation errors.

---

### PUT /api/sprints/{id}

- **Controller Action:** `SprintController@update`

- **Authorization:** Bearer Token


**Path Parameters:**

| Name | Type | Description |

|------|------|-------------|

| `id` | integer/string | The id of the resource. |


**Request Body / Payload (Validated via `SprintRequest`):**

| Field | Type | Required | Validation Rules |

|-------|------|----------|------------------|

| `formation_id` | `string` | Yes | required, exists:formations,id |

| `name` | `string` | Yes | required, string, min:2, max:50 |

| `description` | `string` | Yes | required, string, min:2 |

| `start_date` | `date` | Yes | required, date |

| `end_date` | `date` | Yes | required, date, after:start_date |

| `skills` | `array` | Yes | required, array |


**Expected Responses:**

- `200 OK`: Returns the updated resource.

- `422 Unprocessable Entity`: Validation errors.

---

### DELETE /api/sprints/{id}

- **Controller Action:** `SprintController@destroy`

- **Authorization:** Bearer Token


**Path Parameters:**

| Name | Type | Description |

|------|------|-------------|

| `id` | integer/string | The id of the resource. |


**Expected Responses:**

- `200/204 OK`: Resource deleted successfully.

---

### POST /api/sprints/{id}/restore

- **Controller Action:** `SprintController@restore`

- **Authorization:** Bearer Token


**Path Parameters:**

| Name | Type | Description |

|------|------|-------------|

| `id` | integer/string | The id of the resource. |


**Request Body:** Accepts JSON payload.


**Expected Responses:**

- `201 Created`: Returns the newly created resource data.

- `422 Unprocessable Entity`: Validation errors.

---

### GET /api/sprints/formation/{id}

- **Controller Action:** `SprintController@get_sprints_by_formation_id`

- **Authorization:** Bearer Token


**Path Parameters:**

| Name | Type | Description |

|------|------|-------------|

| `id` | integer/string | The id of the resource. |


**Expected Responses:**

---

### GET /api/sprints/{id}/skills

- **Controller Action:** `SprintController@get_sprint_skills`

- **Authorization:** Bearer Token


**Path Parameters:**

| Name | Type | Description |

|------|------|-------------|

| `id` | integer/string | The id of the resource. |


**Expected Responses:**

---

## Runner Module

### GET /api/runners

- **Controller Action:** `RunnerController@index`

- **Authorization:** Bearer Token


**Expected Responses:**

- `200 OK`: Returns a paginated/list array of the resource.

---

### GET /api/runners/all

- **Controller Action:** `RunnerController@getAllRunners`

- **Authorization:** Bearer Token


**Expected Responses:**

---

### GET /api/runners/{id}

- **Controller Action:** `RunnerController@show`

- **Authorization:** Bearer Token


**Path Parameters:**

| Name | Type | Description |

|------|------|-------------|

| `id` | integer/string | The id of the resource. |


**Expected Responses:**

- `200 OK`: Returns the details of the specific resource.

---

### POST /api/runners

- **Controller Action:** `RunnerController@store`

- **Authorization:** Bearer Token


**Request Body / Payload (Validated via `RunnerRequest`):**

| Field | Type | Required | Validation Rules |

|-------|------|----------|------------------|

| `name` | `string` | Yes | required, string, max:255 |

| `description` | `string` | No | nullable, string |

| `type` | `string` | Yes | required, in:http,browser,function |

| `status` | `string` | Yes | required, in:active,deprecated,disabled |


**Expected Responses:**

- `201 Created`: Returns the newly created resource data.

- `422 Unprocessable Entity`: Validation errors.

---

### PUT /api/runners/{id}

- **Controller Action:** `RunnerController@update`

- **Authorization:** Bearer Token


**Path Parameters:**

| Name | Type | Description |

|------|------|-------------|

| `id` | integer/string | The id of the resource. |


**Request Body / Payload (Validated via `RunnerRequest`):**

| Field | Type | Required | Validation Rules |

|-------|------|----------|------------------|

| `name` | `string` | Yes | required, string, max:255 |

| `description` | `string` | No | nullable, string |

| `type` | `string` | Yes | required, in:http,browser,function |

| `status` | `string` | Yes | required, in:active,deprecated,disabled |


**Expected Responses:**

- `200 OK`: Returns the updated resource.

- `422 Unprocessable Entity`: Validation errors.

---

### DELETE /api/runners/{id}

- **Controller Action:** `RunnerController@destroy`

- **Authorization:** Bearer Token


**Path Parameters:**

| Name | Type | Description |

|------|------|-------------|

| `id` | integer/string | The id of the resource. |


**Expected Responses:**

- `200/204 OK`: Resource deleted successfully.

---

## RunnerVersion Module

### GET /api/runner-versions

- **Controller Action:** `RunnerVersionController@index`

- **Authorization:** Bearer Token


**Expected Responses:**

- `200 OK`: Returns a paginated/list array of the resource.

---

### GET /api/runner-versions/all

- **Controller Action:** `RunnerVersionController@getAllRunnerVersions`

- **Authorization:** Bearer Token


**Expected Responses:**

---

### GET /api/runner-versions/{id}

- **Controller Action:** `RunnerVersionController@show`

- **Authorization:** Bearer Token


**Path Parameters:**

| Name | Type | Description |

|------|------|-------------|

| `id` | integer/string | The id of the resource. |


**Expected Responses:**

- `200 OK`: Returns the details of the specific resource.

---

### POST /api/runner-versions

- **Controller Action:** `RunnerVersionController@store`

- **Authorization:** Bearer Token


**Request Body / Payload (Validated via `RunnerVersionRequest`):**

| Field | Type | Required | Validation Rules |

|-------|------|----------|------------------|

| `runner_id` | `string` | Yes | "required, exists:runners,id" |

| `version` | `string` | Yes | "required, string, max:255" |

| `docker_image` | `string` | Yes | "required, string, max:255" |

| `mode` | `string` | Yes | "required, in:http,browser,function" |

| `port` | `integer` | Yes | "required, integer, min:1, max:65535" |

| `healthcheck_path` | `string` | Yes | "required, string, max:255" |

| `cpu` | `number` | Yes | required, numeric, min:0.1 |

| `memory_mb` | `integer` | Yes | required, integer, min:16 |

| `timeout_seconds` | `integer` | Yes | required, integer, min:1 |

| `php` | `boolean` | Yes | required, boolean |

| `node` | `boolean` | Yes | required, boolean |

| `sqlite` | `boolean` | Yes | required, boolean |

| `network_enabled` | `boolean` | Yes | required, boolean |

| `status` | `string` | Yes | "required, in:active,deprecated,disabled" |

| `is_default` | `boolean` | No | boolean |


**Expected Responses:**

- `201 Created`: Returns the newly created resource data.

- `422 Unprocessable Entity`: Validation errors.

---

### DELETE /api/runner-versions/{id}

- **Controller Action:** `RunnerVersionController@destroy`

- **Authorization:** Bearer Token


**Path Parameters:**

| Name | Type | Description |

|------|------|-------------|

| `id` | integer/string | The id of the resource. |


**Expected Responses:**

- `200/204 OK`: Resource deleted successfully.

---

## Stack Module

### GET /api/stacks

- **Controller Action:** `StackController@index`

- **Authorization:** Bearer Token


**Expected Responses:**

- `200 OK`: Returns a paginated/list array of the resource.

---

### GET /api/stacks/{id}

- **Controller Action:** `StackController@show`

- **Authorization:** Bearer Token


**Path Parameters:**

| Name | Type | Description |

|------|------|-------------|

| `id` | integer/string | The id of the resource. |


**Expected Responses:**

- `200 OK`: Returns the details of the specific resource.

---

### POST /api/stacks

- **Controller Action:** `StackController@store`

- **Authorization:** Bearer Token


**Request Body / Payload (Validated via `StackRequest`):**

| Field | Type | Required | Validation Rules |

|-------|------|----------|------------------|

| `name` | `string` | Yes | required, string, max:255 |

| `description` | `string` | No | nullable, string |

| `runner_versions` | `array` | Yes | required, array, min:1 |

| `runner_versions.*.runner_version_id` | `string` | Yes | required, exists:runner_versions,id |

| `runner_versions.*.priority` | `integer` | Yes | required, integer, min:0 |


**Expected Responses:**

- `201 Created`: Returns the newly created resource data.

- `422 Unprocessable Entity`: Validation errors.

---

### PUT /api/stacks/{id}

- **Controller Action:** `StackController@update`

- **Authorization:** Bearer Token


**Path Parameters:**

| Name | Type | Description |

|------|------|-------------|

| `id` | integer/string | The id of the resource. |


**Request Body / Payload (Validated via `StackRequest`):**

| Field | Type | Required | Validation Rules |

|-------|------|----------|------------------|

| `name` | `string` | Yes | required, string, max:255 |

| `description` | `string` | No | nullable, string |

| `runner_versions` | `array` | Yes | required, array, min:1 |

| `runner_versions.*.runner_version_id` | `string` | Yes | required, exists:runner_versions,id |

| `runner_versions.*.priority` | `integer` | Yes | required, integer, min:0 |


**Expected Responses:**

- `200 OK`: Returns the updated resource.

- `422 Unprocessable Entity`: Validation errors.

---

### DELETE /api/stacks/{id}

- **Controller Action:** `StackController@destroy`

- **Authorization:** Bearer Token


**Path Parameters:**

| Name | Type | Description |

|------|------|-------------|

| `id` | integer/string | The id of the resource. |


**Expected Responses:**

- `200/204 OK`: Resource deleted successfully.

---

### POST /api/stacks/{id}/restore

- **Controller Action:** `StackController@restore`

- **Authorization:** Bearer Token


**Path Parameters:**

| Name | Type | Description |

|------|------|-------------|

| `id` | integer/string | The id of the resource. |


**Request Body:** Accepts JSON payload.


**Expected Responses:**

- `201 Created`: Returns the newly created resource data.

- `422 Unprocessable Entity`: Validation errors.

---

### GET /api/stacks

- **Controller Action:** `StackController@getAllStacks`

- **Authorization:** Bearer Token


**Expected Responses:**

---

## Language Module

### GET /api/languages

- **Controller Action:** `LanguageController@index`

- **Authorization:** Bearer Token


**Expected Responses:**

- `200 OK`: Returns a paginated/list array of the resource.

---

### GET /api/languages/{id}

- **Controller Action:** `LanguageController@show`

- **Authorization:** Bearer Token


**Path Parameters:**

| Name | Type | Description |

|------|------|-------------|

| `id` | integer/string | The id of the resource. |


**Expected Responses:**

- `200 OK`: Returns the details of the specific resource.

---

### POST /api/languages

- **Controller Action:** `LanguageController@store`

- **Authorization:** Bearer Token


**Request Body / Payload (Validated via `LanguageRequest`):**

| Field | Type | Required | Validation Rules |

|-------|------|----------|------------------|

| `name` | `string` | Yes | required, string, max:255 |

| `docker_image` | `string` | Yes | required, string, max:255 |

| `compile_command` | `string` | No | nullable, string, max:255 |

| `run_command` | `string` | Yes | required, string, max:255 |


**Expected Responses:**

- `201 Created`: Returns the newly created resource data.

- `422 Unprocessable Entity`: Validation errors.

---

### PUT /api/languages/{id}

- **Controller Action:** `LanguageController@update`

- **Authorization:** Bearer Token


**Path Parameters:**

| Name | Type | Description |

|------|------|-------------|

| `id` | integer/string | The id of the resource. |


**Request Body / Payload (Validated via `LanguageRequest`):**

| Field | Type | Required | Validation Rules |

|-------|------|----------|------------------|

| `name` | `string` | Yes | required, string, max:255 |

| `docker_image` | `string` | Yes | required, string, max:255 |

| `compile_command` | `string` | No | nullable, string, max:255 |

| `run_command` | `string` | Yes | required, string, max:255 |


**Expected Responses:**

- `200 OK`: Returns the updated resource.

- `422 Unprocessable Entity`: Validation errors.

---

### DELETE /api/languages/{id}

- **Controller Action:** `LanguageController@destroy`

- **Authorization:** Bearer Token


**Path Parameters:**

| Name | Type | Description |

|------|------|-------------|

| `id` | integer/string | The id of the resource. |


**Expected Responses:**

- `200/204 OK`: Resource deleted successfully.

---

### POST /api/languages/{id}/restore

- **Controller Action:** `LanguageController@restore`

- **Authorization:** Bearer Token


**Path Parameters:**

| Name | Type | Description |

|------|------|-------------|

| `id` | integer/string | The id of the resource. |


**Request Body:** Accepts JSON payload.


**Expected Responses:**

- `201 Created`: Returns the newly created resource data.

- `422 Unprocessable Entity`: Validation errors.

---

### GET /api/languages

- **Controller Action:** `LanguageController@getAllLanguages`

- **Authorization:** Bearer Token


**Expected Responses:**

---

## StackRunner Module

### GET /api/stack-runners

- **Controller Action:** `StackRunnerController@index`

- **Authorization:** Bearer Token


**Expected Responses:**

- `200 OK`: Returns a paginated/list array of the resource.

---

### GET /api/stack-runners/{id}

- **Controller Action:** `StackRunnerController@show`

- **Authorization:** Bearer Token


**Path Parameters:**

| Name | Type | Description |

|------|------|-------------|

| `id` | integer/string | The id of the resource. |


**Expected Responses:**

- `200 OK`: Returns the details of the specific resource.

---

### POST /api/stack-runners

- **Controller Action:** `StackRunnerController@store`

- **Authorization:** Bearer Token


**Request Body / Payload (Validated via `StackRunnerRequest`):**

| Field | Type | Required | Validation Rules |

|-------|------|----------|------------------|

| `stack_id` | `string` | Yes | required, exists:stacks,id |

| `runner_version_id` | `string` | Yes | required, exists:runner_versions,id |

| `priority` | `integer` | Yes | required, integer, min:1 |


**Expected Responses:**

- `201 Created`: Returns the newly created resource data.

- `422 Unprocessable Entity`: Validation errors.

---

### PUT /api/stack-runners/{id}

- **Controller Action:** `StackRunnerController@update`

- **Authorization:** Bearer Token


**Path Parameters:**

| Name | Type | Description |

|------|------|-------------|

| `id` | integer/string | The id of the resource. |


**Request Body / Payload (Validated via `StackRunnerRequest`):**

| Field | Type | Required | Validation Rules |

|-------|------|----------|------------------|

| `stack_id` | `string` | Yes | required, exists:stacks,id |

| `runner_version_id` | `string` | Yes | required, exists:runner_versions,id |

| `priority` | `integer` | Yes | required, integer, min:1 |


**Expected Responses:**

- `200 OK`: Returns the updated resource.

- `422 Unprocessable Entity`: Validation errors.

---

### DELETE /api/stack-runners/{id}

- **Controller Action:** `StackRunnerController@destroy`

- **Authorization:** Bearer Token


**Path Parameters:**

| Name | Type | Description |

|------|------|-------------|

| `id` | integer/string | The id of the resource. |


**Expected Responses:**

- `200/204 OK`: Resource deleted successfully.

---

## Brief Module

### GET /api/get_teacher_briefs

- **Controller Action:** `BriefController@index`

- **Authorization:** Bearer Token


**Expected Responses:**

- `200 OK`: Returns a paginated/list array of the resource.

---

### GET /api/briefs/{id}

- **Controller Action:** `BriefController@show`

- **Authorization:** Bearer Token


**Path Parameters:**

| Name | Type | Description |

|------|------|-------------|

| `id` | integer/string | The id of the resource. |


**Expected Responses:**

- `200 OK`: Returns the details of the specific resource.

---

### POST /api/briefs

- **Controller Action:** `BriefController@store`

- **Authorization:** Bearer Token


**Request Body / Payload (Validated via `BriefRequest`):**

| Field | Type | Required | Validation Rules |

|-------|------|----------|------------------|

| `sprint_id` | `integer` | Yes | "required, exists:sprints,id" |

| `class_group_id` | `string` | Yes | "required, exists:class_groups,id" |

| `stack_id` | `string` | Yes | "required, exists:stacks,id" |

| `title` | `string` | Yes | "required, string, min:2, max:50" |

| `description` | `string` | Yes | "required, string, min:2, max:255" |

| `content` | `string` | Yes | "required, string, min:2" |

| `is_collective` | `boolean` | Yes | "required, boolean" |

| `start_date` | `date` | Yes | "required, date, after_or_equal:today" |

| `end_date` | `date` | Yes | "required, date, after:start_date" |

| `skill_levels` | `array` | Yes | "required, array, min:1" |

| `skill_levels.*.level_id` | `string` | Yes | "required, exists:levels,id" |

| `skill_levels.*.skill_id` | `string` | Yes | "required, exists:skills,id" |


**Expected Responses:**

- `201 Created`: Returns the newly created resource data.

- `422 Unprocessable Entity`: Validation errors.

---

### PUT /api/briefs/{id}

- **Controller Action:** `BriefController@update`

- **Authorization:** Bearer Token


**Path Parameters:**

| Name | Type | Description |

|------|------|-------------|

| `id` | integer/string | The id of the resource. |


**Request Body / Payload (Validated via `BriefRequest`):**

| Field | Type | Required | Validation Rules |

|-------|------|----------|------------------|

| `sprint_id` | `integer` | Yes | "required, exists:sprints,id" |

| `class_group_id` | `string` | Yes | "required, exists:class_groups,id" |

| `stack_id` | `string` | Yes | "required, exists:stacks,id" |

| `title` | `string` | Yes | "required, string, min:2, max:50" |

| `description` | `string` | Yes | "required, string, min:2, max:255" |

| `content` | `string` | Yes | "required, string, min:2" |

| `is_collective` | `boolean` | Yes | "required, boolean" |

| `start_date` | `date` | Yes | "required, date, after_or_equal:today" |

| `end_date` | `date` | Yes | "required, date, after:start_date" |

| `skill_levels` | `array` | Yes | "required, array, min:1" |

| `skill_levels.*.level_id` | `string` | Yes | "required, exists:levels,id" |

| `skill_levels.*.skill_id` | `string` | Yes | "required, exists:skills,id" |


**Expected Responses:**

- `200 OK`: Returns the updated resource.

- `422 Unprocessable Entity`: Validation errors.

---

### DELETE /api/briefs/{id}

- **Controller Action:** `BriefController@destroy`

- **Authorization:** Bearer Token


**Path Parameters:**

| Name | Type | Description |

|------|------|-------------|

| `id` | integer/string | The id of the resource. |


**Expected Responses:**

- `200/204 OK`: Resource deleted successfully.

---

### POST /api/briefs/{id}/restore

- **Controller Action:** `BriefController@restore`

- **Authorization:** Bearer Token


**Path Parameters:**

| Name | Type | Description |

|------|------|-------------|

| `id` | integer/string | The id of the resource. |


**Request Body:** Accepts JSON payload.


**Expected Responses:**

- `201 Created`: Returns the newly created resource data.

- `422 Unprocessable Entity`: Validation errors.

---

### GET /api/get_teacher_briefs

- **Controller Action:** `BriefController@get_teacher_briefs`

- **Authorization:** Bearer Token


**Expected Responses:**

---

### GET /api/briefs/{id}

- **Controller Action:** `BriefController@show`

- **Authorization:** Bearer Token


**Path Parameters:**

| Name | Type | Description |

|------|------|-------------|

| `id` | integer/string | The id of the resource. |


**Expected Responses:**

- `200 OK`: Returns the details of the specific resource.

---

### POST /api/briefs

- **Controller Action:** `BriefController@store`

- **Authorization:** Bearer Token


**Request Body / Payload (Validated via `BriefRequest`):**

| Field | Type | Required | Validation Rules |

|-------|------|----------|------------------|

| `sprint_id` | `integer` | Yes | "required, exists:sprints,id" |

| `class_group_id` | `string` | Yes | "required, exists:class_groups,id" |

| `stack_id` | `string` | Yes | "required, exists:stacks,id" |

| `title` | `string` | Yes | "required, string, min:2, max:50" |

| `description` | `string` | Yes | "required, string, min:2, max:255" |

| `content` | `string` | Yes | "required, string, min:2" |

| `is_collective` | `boolean` | Yes | "required, boolean" |

| `start_date` | `date` | Yes | "required, date, after_or_equal:today" |

| `end_date` | `date` | Yes | "required, date, after:start_date" |

| `skill_levels` | `array` | Yes | "required, array, min:1" |

| `skill_levels.*.level_id` | `string` | Yes | "required, exists:levels,id" |

| `skill_levels.*.skill_id` | `string` | Yes | "required, exists:skills,id" |


**Expected Responses:**

- `201 Created`: Returns the newly created resource data.

- `422 Unprocessable Entity`: Validation errors.

---

### PUT /api/briefs/{id}

- **Controller Action:** `BriefController@update`

- **Authorization:** Bearer Token


**Path Parameters:**

| Name | Type | Description |

|------|------|-------------|

| `id` | integer/string | The id of the resource. |


**Request Body / Payload (Validated via `BriefRequest`):**

| Field | Type | Required | Validation Rules |

|-------|------|----------|------------------|

| `sprint_id` | `integer` | Yes | "required, exists:sprints,id" |

| `class_group_id` | `string` | Yes | "required, exists:class_groups,id" |

| `stack_id` | `string` | Yes | "required, exists:stacks,id" |

| `title` | `string` | Yes | "required, string, min:2, max:50" |

| `description` | `string` | Yes | "required, string, min:2, max:255" |

| `content` | `string` | Yes | "required, string, min:2" |

| `is_collective` | `boolean` | Yes | "required, boolean" |

| `start_date` | `date` | Yes | "required, date, after_or_equal:today" |

| `end_date` | `date` | Yes | "required, date, after:start_date" |

| `skill_levels` | `array` | Yes | "required, array, min:1" |

| `skill_levels.*.level_id` | `string` | Yes | "required, exists:levels,id" |

| `skill_levels.*.skill_id` | `string` | Yes | "required, exists:skills,id" |


**Expected Responses:**

- `200 OK`: Returns the updated resource.

- `422 Unprocessable Entity`: Validation errors.

---

### DELETE /api/briefs/{id}

- **Controller Action:** `BriefController@destroy`

- **Authorization:** Bearer Token


**Path Parameters:**

| Name | Type | Description |

|------|------|-------------|

| `id` | integer/string | The id of the resource. |


**Expected Responses:**

- `200/204 OK`: Resource deleted successfully.

---

### POST /api/briefs/{id}/restore

- **Controller Action:** `BriefController@restore`

- **Authorization:** Bearer Token


**Path Parameters:**

| Name | Type | Description |

|------|------|-------------|

| `id` | integer/string | The id of the resource. |


**Request Body:** Accepts JSON payload.


**Expected Responses:**

- `201 Created`: Returns the newly created resource data.

- `422 Unprocessable Entity`: Validation errors.

---

### GET /api/briefs/class-group/{id}

- **Controller Action:** `BriefController@get_class_group_briefs`

- **Authorization:** Bearer Token


**Path Parameters:**

| Name | Type | Description |

|------|------|-------------|

| `id` | integer/string | The id of the resource. |


**Expected Responses:**

---

### GET /api/briefs

- **Controller Action:** `BriefController@get_student_briefs`

- **Authorization:** Bearer Token


**Expected Responses:**

---

### GET /api/briefs/{id}

- **Controller Action:** `BriefController@show`

- **Authorization:** Bearer Token


**Path Parameters:**

| Name | Type | Description |

|------|------|-------------|

| `id` | integer/string | The id of the resource. |


**Expected Responses:**

- `200 OK`: Returns the details of the specific resource.

---

## Teacher Module

### GET /api/teacher/

- **Controller Action:** `TeacherController@index`

- **Authorization:** Bearer Token (Teacher)


**Expected Responses:**

- `200 OK`: Returns a paginated/list array of the resource.

---

## BriefVersion Module

### GET /api/brief-versions

- **Controller Action:** `BriefVersionController@index`

- **Authorization:** Bearer Token


**Expected Responses:**

- `200 OK`: Returns a paginated/list array of the resource.

---

### GET /api/briefs/{id}/versions

- **Controller Action:** `BriefVersionController@get_brief_versions`

- **Authorization:** Bearer Token


**Path Parameters:**

| Name | Type | Description |

|------|------|-------------|

| `id` | integer/string | The id of the resource. |


**Expected Responses:**

---

### GET /api/brief-versions/{id}

- **Controller Action:** `BriefVersionController@show`

- **Authorization:** Bearer Token


**Path Parameters:**

| Name | Type | Description |

|------|------|-------------|

| `id` | integer/string | The id of the resource. |


**Expected Responses:**

- `200 OK`: Returns the details of the specific resource.

---

### POST /api/brief-versions

- **Controller Action:** `BriefVersionController@store`

- **Authorization:** Bearer Token


**Request Body / Payload (Validated via `BriefVersionRequest`):**

*Could not parse specific rules, but requires payload.*


**Expected Responses:**

- `201 Created`: Returns the newly created resource data.

- `422 Unprocessable Entity`: Validation errors.

---

### DELETE /api/brief-versions/{id}

- **Controller Action:** `BriefVersionController@destroy`

- **Authorization:** Bearer Token


**Path Parameters:**

| Name | Type | Description |

|------|------|-------------|

| `id` | integer/string | The id of the resource. |


**Expected Responses:**

- `200/204 OK`: Resource deleted successfully.

---

### POST /api/brief-versions/{id}/restore

- **Controller Action:** `BriefVersionController@restore`

- **Authorization:** Bearer Token


**Path Parameters:**

| Name | Type | Description |

|------|------|-------------|

| `id` | integer/string | The id of the resource. |


**Request Body:** Accepts JSON payload.


**Expected Responses:**

- `201 Created`: Returns the newly created resource data.

- `422 Unprocessable Entity`: Validation errors.

---

## Problem Module

### GET /api/teacher/problems

- **Controller Action:** `ProblemController@index`

- **Authorization:** Bearer Token (Teacher)


**Expected Responses:**

- `200 OK`: Returns a paginated/list array of the resource.

---

### GET /api/teacher/problems/{id}

- **Controller Action:** `ProblemController@show`

- **Authorization:** Bearer Token (Teacher)


**Path Parameters:**

| Name | Type | Description |

|------|------|-------------|

| `id` | integer/string | The id of the resource. |


**Expected Responses:**

- `200 OK`: Returns the details of the specific resource.

---

### POST /api/teacher/problems

- **Controller Action:** `ProblemController@store`

- **Authorization:** Bearer Token (Teacher)


**Request Body / Payload (Validated via `ProblemRequest`):**

| Field | Type | Required | Validation Rules |

|-------|------|----------|------------------|

| `brief_id` | `string` | Yes | required, exists:briefs,id |

| `brief_skill_level_id` | `string` | Yes | required, exists:brief_skill_levels,id |

| `language_id` | `string` | Yes | required, exists:languages,id |

| `title` | `string` | Yes | required, string, max:255 |

| `description` | `string` | Yes | required, string |

| `hidden_header` | `string` | No | nullable, string |

| `hidden_footer` | `string` | No | nullable, string |

| `skeleton_code` | `string` | No | nullable, string |

| `order_index` | `integer` | Yes | required, integer, min:0 |


**Expected Responses:**

- `201 Created`: Returns the newly created resource data.

- `422 Unprocessable Entity`: Validation errors.

---

### PUT /api/teacher/problems/{id}

- **Controller Action:** `ProblemController@update`

- **Authorization:** Bearer Token (Teacher)


**Path Parameters:**

| Name | Type | Description |

|------|------|-------------|

| `id` | integer/string | The id of the resource. |


**Request Body / Payload (Validated via `ProblemRequest`):**

| Field | Type | Required | Validation Rules |

|-------|------|----------|------------------|

| `brief_id` | `string` | Yes | required, exists:briefs,id |

| `brief_skill_level_id` | `string` | Yes | required, exists:brief_skill_levels,id |

| `language_id` | `string` | Yes | required, exists:languages,id |

| `title` | `string` | Yes | required, string, max:255 |

| `description` | `string` | Yes | required, string |

| `hidden_header` | `string` | No | nullable, string |

| `hidden_footer` | `string` | No | nullable, string |

| `skeleton_code` | `string` | No | nullable, string |

| `order_index` | `integer` | Yes | required, integer, min:0 |


**Expected Responses:**

- `200 OK`: Returns the updated resource.

- `422 Unprocessable Entity`: Validation errors.

---

### DELETE /api/teacher/problems/{id}

- **Controller Action:** `ProblemController@destroy`

- **Authorization:** Bearer Token (Teacher)


**Path Parameters:**

| Name | Type | Description |

|------|------|-------------|

| `id` | integer/string | The id of the resource. |


**Expected Responses:**

- `200/204 OK`: Resource deleted successfully.

---

### POST /api/teacher/problems/{id}/restore

- **Controller Action:** `ProblemController@restore`

- **Authorization:** Bearer Token (Teacher)


**Path Parameters:**

| Name | Type | Description |

|------|------|-------------|

| `id` | integer/string | The id of the resource. |


**Request Body:** Accepts JSON payload.


**Expected Responses:**

- `201 Created`: Returns the newly created resource data.

- `422 Unprocessable Entity`: Validation errors.

---

## ProblemTestCase Module

### GET /api/teacher/problem-test-cases

- **Controller Action:** `ProblemTestCaseController@index`

- **Authorization:** Bearer Token (Teacher)


**Expected Responses:**

- `200 OK`: Returns a paginated/list array of the resource.

---

### GET /api/teacher/problem-test-cases/{id}

- **Controller Action:** `ProblemTestCaseController@show`

- **Authorization:** Bearer Token (Teacher)


**Path Parameters:**

| Name | Type | Description |

|------|------|-------------|

| `id` | integer/string | The id of the resource. |


**Expected Responses:**

- `200 OK`: Returns the details of the specific resource.

---

### POST /api/teacher/problem-test-cases

- **Controller Action:** `ProblemTestCaseController@store`

- **Authorization:** Bearer Token (Teacher)


**Request Body / Payload (Validated via `ProblemTestCaseRequest`):**

| Field | Type | Required | Validation Rules |

|-------|------|----------|------------------|

| `problem_id` | `string` | Yes | required, exists:problems,id |

| `input` | `array` | Yes | required, array |

| `input.*` | `string` | Yes | required |

| `expected_output` | `array` | Yes | required, array |

| `expected_output.*` | `string` | Yes | required |

| `is_hidden` | `boolean` | No | boolean |


**Expected Responses:**

- `201 Created`: Returns the newly created resource data.

- `422 Unprocessable Entity`: Validation errors.

---

### DELETE /api/teacher/problem-test-cases/{id}

- **Controller Action:** `ProblemTestCaseController@destroy`

- **Authorization:** Bearer Token (Teacher)


**Path Parameters:**

| Name | Type | Description |

|------|------|-------------|

| `id` | integer/string | The id of the resource. |


**Expected Responses:**

- `200/204 OK`: Resource deleted successfully.

---

### POST /api/teacher/problem-test-cases/{id}/restore

- **Controller Action:** `ProblemTestCaseController@restore`

- **Authorization:** Bearer Token (Teacher)


**Path Parameters:**

| Name | Type | Description |

|------|------|-------------|

| `id` | integer/string | The id of the resource. |


**Request Body:** Accepts JSON payload.


**Expected Responses:**

- `201 Created`: Returns the newly created resource data.

- `422 Unprocessable Entity`: Validation errors.

---

## Submission Module

### GET /api/submissions/student/{id}

- **Controller Action:** `SubmissionController@get_student_submissions`

- **Authorization:** Bearer Token (Student)


**Path Parameters:**

| Name | Type | Description |

|------|------|-------------|

| `id` | integer/string | The id of the resource. |


**Expected Responses:**

---

### GET /api/briefs/{brief_id}/students/{student_id}/submission

- **Controller Action:** `SubmissionController@get_student_brief_submission`

- **Authorization:** Bearer Token (Student)


**Path Parameters:**

| Name | Type | Description |

|------|------|-------------|

| `brief_id` | integer/string | The brief_id of the resource. |

| `student_id` | integer/string | The student_id of the resource. |


**Expected Responses:**

---

### GET /api/submissions

- **Controller Action:** `SubmissionController@get_student_submissions`

- **Authorization:** Bearer Token


**Expected Responses:**

---

### GET /api/submissions/{id}

- **Controller Action:** `SubmissionController@show`

- **Authorization:** Bearer Token


**Path Parameters:**

| Name | Type | Description |

|------|------|-------------|

| `id` | integer/string | The id of the resource. |


**Expected Responses:**

- `200 OK`: Returns the details of the specific resource.

---

### POST /api/submissions

- **Controller Action:** `SubmissionController@store`

- **Authorization:** Bearer Token


**Request Body / Payload (Validated via `SubmissionRequest`):**

| Field | Type | Required | Validation Rules |

|-------|------|----------|------------------|

| `brief_id` | `string` | Yes | required, exists:briefs,id |

| `squad_id ` | `string` | No | nullable, exists:squads,id |

| `message` | `string` | Yes | required, string, min:2 |

| `link` | `string` | Yes | required, string, regex:/^(https?:\/\/)?(www\.)?github\.com\/[A-Za-z0-9_-]+\/[A-Za-z0-9_-]+(\/)?\.git$/, min:5 |


**Expected Responses:**

- `201 Created`: Returns the newly created resource data.

- `422 Unprocessable Entity`: Validation errors.

---

## Correction Module

### GET /api/corrections/students/{id}

- **Controller Action:** `CorrectionController@get_student_corrections`

- **Authorization:** Bearer Token (Student)


**Path Parameters:**

| Name | Type | Description |

|------|------|-------------|

| `id` | integer/string | The id of the resource. |


**Expected Responses:**

---

### GET /api/corrections/{brief_id}/{student_id}

- **Controller Action:** `CorrectionController@get_student_correction`

- **Authorization:** Bearer Token


**Path Parameters:**

| Name | Type | Description |

|------|------|-------------|

| `brief_id` | integer/string | The brief_id of the resource. |

| `student_id` | integer/string | The student_id of the resource. |


**Expected Responses:**

---

### GET /api/corrections

- **Controller Action:** `CorrectionController@get_student_corrections`

- **Authorization:** Bearer Token


**Expected Responses:**

---

### GET /api/corrections/{id}

- **Controller Action:** `CorrectionController@show`

- **Authorization:** Bearer Token


**Path Parameters:**

| Name | Type | Description |

|------|------|-------------|

| `id` | integer/string | The id of the resource. |


**Expected Responses:**

- `200 OK`: Returns the details of the specific resource.

---

## BriefSkillLevel Module

### GET /api/briefs/{id}/skill-levels

- **Controller Action:** `BriefSkillLevelController@getBriefSkillLevelsByBriefId`

- **Authorization:** Bearer Token


**Path Parameters:**

| Name | Type | Description |

|------|------|-------------|

| `id` | integer/string | The id of the resource. |


**Expected Responses:**

---

## Student Module

### GET /api/student/dashboard

- **Controller Action:** `StudentController@getDashboardData`

- **Authorization:** Bearer Token (Student)


**Expected Responses:**

---

## ProblemSubmission Module

### GET /api/teacher/problem-submissions

- **Controller Action:** `ProblemSubmissionController@index`

- **Authorization:** Bearer Token (Teacher)


**Expected Responses:**

- `200 OK`: Returns a paginated/list array of the resource.

---

### POST /api/teacher/problem-submissions

- **Controller Action:** `ProblemSubmissionController@store`

- **Authorization:** Bearer Token (Teacher)


**Request Body / Payload (Validated via `ProblemSubmissionRequest`):**

| Field | Type | Required | Validation Rules |

|-------|------|----------|------------------|

| `submission_id` | `string` | Yes | required, exists:submissions,id |

| `submissions` | `array` | Yes | required, array |

| `submissions.*.problem_id` | `string` | Yes | required, exists:problems,id |

| `submissions.*.code` | `string` | Yes | required, string |


**Expected Responses:**

- `201 Created`: Returns the newly created resource data.

- `422 Unprocessable Entity`: Validation errors.

---

### GET /api/teacher/problem-submissions/{id}

- **Controller Action:** `ProblemSubmissionController@show`

- **Authorization:** Bearer Token (Teacher)


**Path Parameters:**

| Name | Type | Description |

|------|------|-------------|

| `id` | integer/string | The id of the resource. |


**Expected Responses:**

- `200 OK`: Returns the details of the specific resource.

---

## EvaluationJob Module

### GET /api/worker/evaluation-jobs/{id}

- **Controller Action:** `EvaluationJobController@show`

- **Authorization:** Bearer Token


**Path Parameters:**

| Name | Type | Description |

|------|------|-------------|

| `id` | integer/string | The id of the resource. |


**Expected Responses:**

- `200 OK`: Returns the details of the specific resource.

---

### PUT /api/worker/evaluation-jobs/{id}

- **Controller Action:** `EvaluationJobController@update`

- **Authorization:** Bearer Token


**Path Parameters:**

| Name | Type | Description |

|------|------|-------------|

| `id` | integer/string | The id of the resource. |


**Request Body:** Accepts JSON payload.


**Expected Responses:**

- `200 OK`: Returns the updated resource.

- `422 Unprocessable Entity`: Validation errors.

---

## ProblemSubmissionJob Module

### GET /api/teacher/problem-submission-jobs/{id}

- **Controller Action:** `ProblemSubmissionJobController@show`

- **Authorization:** Bearer Token (Teacher)


**Path Parameters:**

| Name | Type | Description |

|------|------|-------------|

| `id` | integer/string | The id of the resource. |


**Expected Responses:**

- `200 OK`: Returns the details of the specific resource.

---

### PUT /api/teacher/problem-submission-jobs/{id}

- **Controller Action:** `ProblemSubmissionJobController@update`

- **Authorization:** Bearer Token (Teacher)


**Path Parameters:**

| Name | Type | Description |

|------|------|-------------|

| `id` | integer/string | The id of the resource. |


**Request Body:** Accepts JSON payload.


**Expected Responses:**

- `200 OK`: Returns the updated resource.

- `422 Unprocessable Entity`: Validation errors.

---
