using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using test.Data;
using test.Models;

namespace test.Controllers
{
  //  [Authorize(Roles = "Administrators")]
    [ApiController]
    [Route("api/[controller]")]
    public class UsersController : ControllerBase
    {
        ApplicationDbContext context;
        public UsersController(ApplicationDbContext applicationDbContext)
        {
            context = applicationDbContext;
        }
        [HttpGet]
        public IEnumerable<ApplicationUser> Get() => context.Users;

        [HttpGet("id")]
        public async Task<ApplicationUser?> GetAsync(string id)
        {
            return await context.Users.FindAsync(id);
        }
    }
}
